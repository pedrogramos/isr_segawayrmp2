#include <iostream>
#include <fstream>
#include <sstream>
#include <cmath>
#include <stdlib.h>
#include <stdio.h>
#include <ros/ros.h>
#include <signal.h>
#include <termios.h>
#include <tf/transform_broadcaster.h>
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Point.h"
#include "geometry_msgs/Pose2D.h"
#include "nav_msgs/Odometry.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"
#include <turtlesim/Pose.h>
#include <queue>
//TF2
#include "RMPISR/addpoint.h"
#include "RMPISR/go.h"
#include "RMPISR/stop.h"

using namespace std;

#define PI 3.141592
#define Kl 0.3
#define Kw 0.6 //0.6
enum states{GO,STOP,STOPPING,ADDPOINT};
enum states state=GO;
struct point { float xf; float yf;} new_point, aux_s;
queue<point> fila_pontos, aux_q;


class SendVelocity
{
public:
  SendVelocity();
  void sendVel(double,double);
  void stopRMP();
  //para a turtlesim
  //void odomCallback(const turtlesim::PoseConstPtr&);
  //para o segwayRMP
  //void odomCallback(const nav_msgs::Odometry::ConstPtr&);
  void odomCallback(const geometry_msgs::Pose2D::ConstPtr&);
  void infoOdom();
  void goTo(float,float,float);
  bool def_go(RMPISR::go::Request&, RMPISR::go::Response&);
  bool def_addpoint(RMPISR::addpoint::Request&, RMPISR::addpoint::Response&);
  bool def_stop(RMPISR::stop::Request&, RMPISR::stop::Response&);


private:

  
  ros::NodeHandle nh;
  ros::Publisher vel_pub;
  ros::Subscriber odom_sub;
  ros::ServiceServer service0;
  ros::ServiceServer service1;
  ros::ServiceServer service2;
  //ros::Publisher vazio_pub;
  //ros::Subscriber vazio_sub;
  geometry_msgs::Twist vel;
  double odomX, odomY, odomTheta;
  double roll, pitch, yaw;
  nav_msgs::Odometry::ConstPtr poseRMP;
  geometry_msgs::Pose2D::ConstPtr pose;

  

  
};

SendVelocity::SendVelocity(){

  //para o turtle
  //vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1);
  //odom_sub = nh.subscribe("/turtle1/pose",10,&SendVelocity::odomCallback,this);
  // para o segway
  vel_pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
  //odom_sub = nh.subscribe("/segway_rmp_node/odom",10,&SendVelocity::odomCallback,this);
  odom_sub =  nh.subscribe("odomUpdater",10,&SendVelocity::odomCallback,this);
  service0 = nh.advertiseService("go",&SendVelocity::def_go,this);
  service1 = nh.advertiseService("addpoint", &SendVelocity::def_addpoint, this);
  service2 = nh.advertiseService("stop",&SendVelocity::def_stop,this);

  //vazio_pub=nh.advertise<std_msgs::Bool>("/pedro",1);
  //vazio_sub=nh.subscribe("/pedro",1,&SendVelocity::stopTurtle,this);


  //Foo foo_object;
  //ros::Subscriber sub = nh.subscribe("my_topic", 1, &Foo::callback, &foo_object);
  
}


void SendVelocity::sendVel(double line_x, double ang_z){

  vel.linear.x = line_x;
  vel.angular.z = ang_z;
  vel_pub.publish(vel);

  //ROS_INFO("Velocity Comands: linear= %f e angular= %f", vel.linear.x, vel.angular.z);

  return;
}


void SendVelocity::stopRMP(){

  sendVel(0.0,0.0);
  ROS_INFO("STOP!!");
}

/*
void chatterCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
  ROS_INFO("Seq: [%d]", msg->header.seq);
  ROS_INFO("Position-> x: [%f], y: [%f], z: [%f]", msg->pose.pose.position.x,msg->pose.pose.position.y, msg->pose.pose.position.z);
  ROS_INFO("Orientation-> x: [%f], y: [%f], z: [%f], w: [%f]", msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
  ROS_INFO("Vel-> Linear: [%f], Angular: [%f]", msg->twist.twist.linear.x,msg->twist.twist.angular.z);
}
*/

//RMP ROS Package
/*
void SendVelocity::odomCallback(const nav_msgs::Odometry::ConstPtr& msg){
  odomX = msg->pose.pose.position.x;
  odomY = msg->pose.pose.position.y;
  tf::Quaternion q(msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
  tf::Matrix3x3 m(q);
  m.getRPY(roll, pitch, yaw);
  odomTheta = yaw;
  poseRMP=msg;

  //ROS_INFO("OdometriaFun: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);

}*/


// já é a minha função de odometria implemtada
void SendVelocity::odomCallback(const geometry_msgs::Pose2D::ConstPtr& msg){
odomX=msg->x;
odomY=msg->y;
odomTheta=msg->theta;

//ROS_INFO("OdometriaFun: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);
}

//turtlesim odom
/*
// rosmsg show [turtlesim/Pose] = msg1-> [x] 
void SendVelocity::odomCallback(const turtlesim::PoseConstPtr& msg1){ 
  // nav_msgs::Odometry --> pose.pose.position.
  //para a turtlesim
  odomX = msg1->x;
  odomY = msg1->y;
  odomTheta = msg1->theta;
  aPose=msg1;


  //ROS_INFO("Odometria: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);
}*/


void SendVelocity::infoOdom(){

  ROS_DEBUG("OdometriaFun: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);
}


void SendVelocity::goTo(float xf, float yf,float limiar){
  // calculo do módulo
  float d=sqrt(pow((xf-odomX),2)+pow((yf-odomY),2));
  // calculo da circunferencia de bullseye
  float c=pow((xf-odomX),2)+pow((yf-odomY),2);
  ROS_INFO("Proximo ponto: X= %f e Y= %f.",xf, yf);

  //enquanto o RMP estiver fora do raio da circunferencia
  while (c>pow(limiar,2)){ 
    c=pow((xf-odomX),2)+pow((yf-odomY),2);
    d=sqrt(pow((xf-odomX),2)+pow((yf-odomY),2));
    // vetores normalizados -> versor
    float dx=(xf-odomX)/d;
    float dy=(yf-odomY)/d;
    // calculo velocidades a enviar
    float vx=cos(odomTheta)*dx+sin(odomTheta)*dy;
    float vy=cos(odomTheta)*dy-sin(odomTheta)*dx;
    // projecções * os ganhos
    sendVel(vx*Kl,vy*Kw);
    //ROS_INFO("vx= %f vw= %f", vx*Kl, vy*Kw);
    ROS_DEBUG("vx= %f vy= %f d= %f xf= %f yf= %f",vx,vy, d, xf, yf);
    ros::spinOnce();
    if (state==STOPPING) return;
  }

  if(c<pow(limiar,2))
    ROS_INFO("Chegou ao ponto: X= %f e Y= %f.",xf, yf);
    fila_pontos.pop();

    //state=GO;
    //infoOdom();
  } 


bool SendVelocity::def_go(RMPISR::go::Request &req_go,RMPISR::go::Response &res_go)
{
  state=GO;
  res_go.state=1;
  //ROS_INFO("sending back response: [%ld]", (long int)res_go.var);
  return true;
}

bool SendVelocity::def_addpoint(RMPISR::addpoint::Request  &req_addpoint, RMPISR::addpoint::Response &res_addpoint)
{
  // usar a lista neste serviço

  ROS_INFO("ENTROU ADD");
for(int i=0;i<req_addpoint.size;i++){


  if(req_addpoint.type==true){
    new_point.xf=req_addpoint.pointArray[i].x;
    new_point.yf=req_addpoint.pointArray[i].y;
    fila_pontos.push(new_point);


  }

    
  if(req_addpoint.type==false){
    while (!fila_pontos.empty()) fila_pontos.pop();
    new_point.xf=req_addpoint.pointArray[i].x;
    new_point.yf=req_addpoint.pointArray[i].y;
    fila_pontos.push(new_point);
  }


  }

    // PRINTING QUEUE
  aux_q=fila_pontos;
  aux_s=aux_q.front();
  while (!aux_q.empty()){
    aux_s=aux_q.front();
    std::cout<< "X= " << aux_s.xf << " Y= " << aux_s.yf << endl;
    aux_q.pop();
  }

  //ROS_INFO("request: x=%f, y=%f, type=%i", (float)req_addpoint.xf,(float)req_addpoint.yf,req_addpoint.type);
  //ROS_INFO("sending back response: [%ld]", (long int)res_addpoint.sum);
  return true;
}

bool SendVelocity::def_stop(RMPISR::stop::Request  &req_stop, RMPISR::stop::Response &res_stop)
{
  state=STOPPING;
  res_stop.state=0;
  //ROS_INFO("sending back response: [%ld]", (long int)res_stop.stop);
  return true;
}




int main(int argc, char** argv)
{
  // nome igual ao do ficheiro
  ros::init(argc, argv, "velocityturtle1_node");
  // criação do objecto da classe
  SendVelocity rmp;


  state=STOP;

  ros::Rate rate(10.0);
  while(ros::ok()){
    switch(state){
      case GO: {
      ROS_INFO("state = GO");

      while(!fila_pontos.empty() && state==GO){
        aux_s=fila_pontos.front();
        rmp.goTo(aux_s.xf,aux_s.yf,0.3);
      }

  
      state=STOPPING;    

      break;
    }

      case STOPPING:{
      ROS_INFO("state = STOPPING");
      rmp.stopRMP();

      state=STOP;
      break;
      }
      case STOP:{
      //ROS_INFO("state = STOP -> IDLE");

      break;
    }
} 
 
  ros::spinOnce();
  rate.sleep();

  }

return 0;
}


/* FILE READ
ifstream myReadFile;
      myReadFile.open("/home/rmp/catkin_ws/src/RMPISR/src/pontos.txt");
      float xf[100];
      float yf[100];
      int i=0;
     int j=0;
     if (myReadFile.is_open()) {
     while (!myReadFile.eof()) {

        myReadFile >> xf[i] >> yf[i];
        i++;
      }
      }
      myReadFile.close();

       while(state==GO && j<i-2){
        rmp.goTo(xf[j],yf[j],0.3);
        j++;
        }
*/

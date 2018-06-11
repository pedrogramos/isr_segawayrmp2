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
#include "RMPISR/odomError.h"

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
  void goTo(float,float,float);
  bool def_go(RMPISR::go::Request&, RMPISR::go::Response&);
  bool def_addpoint(RMPISR::addpoint::Request&, RMPISR::addpoint::Response&);
  bool def_stop(RMPISR::stop::Request&, RMPISR::stop::Response&);
  bool def_odomError(RMPISR::odomError::Request&, RMPISR::odomError::Response&);
  bool opposite=false;


private:

  
  ros::NodeHandle nh;
  ros::Publisher vel_pub;
  ros::Publisher new_odom;
  ros::Subscriber odom_sub;
  ros::ServiceServer service0;
  ros::ServiceServer service1;
  ros::ServiceServer service2;
  ros::ServiceServer service3;
  //ros::Publisher vazio_pub;
  //ros::Subscriber vazio_sub;
  geometry_msgs::Twist vel;
  geometry_msgs::Pose2D odomNew;
  double odomX, odomY, odomTheta;
  double errorX=0;
  double errorY=0;
  double errorTheta=0;
  double roll, pitch, yaw;
  
  bool error_received=false;
  nav_msgs::Odometry::ConstPtr poseRMP;
  geometry_msgs::Pose2D::ConstPtr pose;

  

  
};

SendVelocity::SendVelocity(){

  //para o turtle
  //vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1);
  //odom_sub = nh.subscribe("/turtle1/pose",10,&SendVelocity::odomCallback,this);
  // para o segway
  vel_pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
  new_odom = nh.advertise<geometry_msgs::Pose2D>("new_odom", 10);
  //odom_sub = nh.subscribe("/segway_rmp_node/odom",10,&SendVelocity::odomCallback,this);
  odom_sub =  nh.subscribe("odomUpdater",10,&SendVelocity::odomCallback,this);
  service0 = nh.advertiseService("go",&SendVelocity::def_go,this);
  service1 = nh.advertiseService("addpoint", &SendVelocity::def_addpoint, this);
  service2 = nh.advertiseService("stop",&SendVelocity::def_stop,this);
  service3 = nh.advertiseService("odomError",&SendVelocity::def_odomError,this);

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

odomX = msg->x;
odomY = msg->y;
odomTheta = msg->theta;

//calculo da nova odometria a usar com a compensação do erro proveniente do MarkerDetector
odomNew.x = odomX + errorX;
odomNew.y = odomY + errorY;
odomNew.theta = odomTheta + errorTheta;
new_odom.publish(odomNew);

//ROS_INFO("OdometriaFun: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);
}


void SendVelocity::goTo(float xf, float yf,float limiar){
  // calculo do módulo
  float d=sqrt(pow((xf-odomNew.x),2)+pow((yf-odomNew.y),2));
  // calculo da circunferencia de bullseye
  float c=pow((xf-odomNew.x),2)+pow((yf-odomNew.y),2);
  // calculo do versor para comparacao da direcao da plataforma
  float dxini = (xf-odomNew.x) / d;
  float dyini = (yf-odomNew.y) / d;


  ROS_INFO("Proximo ponto: X= %f e Y= %f.",xf, yf);

  //enquanto o RMP estiver fora do raio da circunferencia c centro no ponto destino
  while (c>pow(limiar,2) && opposite == false){

    c=pow((xf-odomNew.x),2)+pow((yf-odomNew.y),2);
    d=sqrt(pow((xf-odomNew.x),2)+pow((yf-odomNew.y),2));

    // vetores normalizados -> versor
    float dx=(xf-odomNew.x ) / d;
    float dy=(yf-odomNew.y) / d;

    // calculo velocidades a enviar
    float vx=cos(odomNew.theta)*dx+sin(odomNew.theta)*dy;
    float vy=cos(odomNew.theta)*dy-sin(odomNew.theta)*dx;
    // projecções * os ganhos
    sendVel(vx*Kl,vy*Kw);

    if (error_received){
      printf("send velocity function next point check \n");
      float res = dxini*dx + dyini*dy; // calculo do produto interno entre os dois versores
      ROS_INFO("resultado do produto interno: %f", res);
      if (res<-0.8) opposite=true; // sentido diferente, quero sair do ciclo
      error_received=false; // reset à flag do serviço recebido
    }
 


    //ROS_INFO("vx= %f vw= %f", vx*Kl, vy*Kw);
    ROS_DEBUG("vx= %f vy= %f d= %f xf= %f yf= %f",vx,vy, d, xf, yf);
    ros::spinOnce();
    if (state==STOPPING) return;
  }//end while

  if (opposite == true){
    fila_pontos.pop();
    ROS_INFO("Fiz pop porque o vector estava c sentido contrario");

  } 


  if(c<pow(limiar,2))
    ROS_INFO("Chegou ao ponto: X= %f e Y= %f.",xf, yf);
    ROS_INFO("Odom: X= %f  Y= %f  Th= %f", odomNew.x, odomNew.y,odomNew.theta);
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

bool SendVelocity::def_odomError(RMPISR::odomError::Request  &req_error, RMPISR::odomError::Response &res_error)
{
  errorX = req_error.pose.x - odomX;
  errorY = req_error.pose.y - odomY;
  errorTheta = req_error.pose.theta - odomTheta;
  ROS_INFO("Marker Odom: X= %f, Y= %f, e Theta= %f", req_error.pose.x,req_error.pose.y,req_error.pose.theta);
  ROS_INFO("RMP Odom: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);
  ROS_INFO("Error: X= %f  Y= %f  Th= %f", errorX, errorY,errorTheta);
  ros::Duration(0.5).sleep();
  ROS_INFO("Odom Corrigida: X= %f  Y= %f  Th= %f", odomNew.x, odomNew.y,odomNew.theta);
  


  error_received=true;

  return true;
}


int main(int argc, char** argv)
{
  // nome igual ao do ficheiro
  ros::init(argc, argv, "velocityturtle1_node");
  // criação do objecto da classe
  SendVelocity rmp;


  state=STOP;
  printf("RMP ready!\n");

  ros::Rate rate(10.0);
  while(ros::ok()){
    switch(state){
      case GO: {
      ROS_INFO("state = GO");

      while(!fila_pontos.empty() && state==GO){
        rmp.opposite=false;
        aux_s=fila_pontos.front();
        rmp.goTo(aux_s.xf,aux_s.yf,0.2);
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

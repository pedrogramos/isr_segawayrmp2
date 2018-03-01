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
#include "nav_msgs/Odometry.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"
#include <turtlesim/Pose.h>
#include "RMPISR/addpoint.h"
#include "RMPISR/go.h"
#include "RMPISR/stop.h"

#define PI 3.141592
using namespace std;
geometry_msgs::Point point;

void go(ros::NodeHandle nh){
  ros::service::waitForService("go");
  ros::ServiceClient client1 =nh.serviceClient<RMPISR::go>("go");
  RMPISR::go go_;
  client1.call(go_);
}

void stop(ros::NodeHandle nh){
  ros::service::waitForService("stop");
  ros::ServiceClient client2 =nh.serviceClient<RMPISR::go>("stop");
  RMPISR::stop stop_;
  client2.call(stop_);
}

void addpoint(ros::NodeHandle nh, geometry_msgs::Point point){
  ros::service::waitForService("addpoint");
  ros::ServiceClient client3 =nh.serviceClient<RMPISR::addpoint>("addpoint");
  RMPISR::addpoint addpoint_;


  client3.call(addpoint_);
}


int main(int argc, char** argv){
  ros::init(argc, argv, "boss_node");
  ros::NodeHandle nh;

/*  addpoint(nh,6,6,true);
  addpoint(nh,7,7.5,true);
  addpoint(nh,9,7.9,true);
  addpoint(nh,9,9.3,true);
  ros::Duration(2).sleep();
  go(nh);
  ROS_INFO("GO SENT");
  ros::Duration(4).sleep();
  stop(nh);
  ROS_INFO("STOP SENT");
  ros::Duration(3).sleep();
  addpoint(nh,10.1,9,true);
  addpoint(nh,5.9,11,false);
  go(nh);*/

//ROS_INFO("fez todos os addpoint");
  point.x=1;
  point.y=1;









  ros::spin();
  return 0;
}


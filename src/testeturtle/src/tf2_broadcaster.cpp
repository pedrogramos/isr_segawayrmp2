#include <ros/ros.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <turtlesim/Pose.h>
#include "geometry_msgs/Twist.h"
#include "nav_msgs/Odometry.h"

void poseCallback(const turtlesim::PoseConstPtr& msg1){

  static tf2_ros::TransformBroadcaster br;
  geometry_msgs::TransformStamped tWorld_turtle;
  
  tWorld_turtle.header.stamp = ros::Time::now();
  tWorld_turtle.header.frame_id = "world";
  tWorld_turtle.child_frame_id = "turtle1";
  tWorld_turtle.transform.translation.x = msg1->x; //offset em X
  tWorld_turtle.transform.translation.y = msg1->y; //offset em y
  tWorld_turtle.transform.translation.z = 0.0;   //offset em z
  tf2::Quaternion q;
  q.setRPY(0, 0, msg1->theta);                        //offset em theta
  tWorld_turtle.transform.rotation.x = q.x();
  tWorld_turtle.transform.rotation.y = q.y();
  tWorld_turtle.transform.rotation.z = q.z();
  tWorld_turtle.transform.rotation.w = q.w();

  br.sendTransform(tWorld_turtle);
  //sendTransform and StampedTransform have opposite ordering of parent and child.
}

int main(int argc, char** argv){
  ros::init(argc, argv, "tf2broadcaster_node");

  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe("/turtle1/pose", 10, &poseCallback);

  ros::spin();
  return 0;
};
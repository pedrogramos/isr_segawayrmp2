#!/usr/bin/env python
import rospy
import sys
import numpy
from RMPISR.srv import *
from geometry_msgs.msg import Pose2D
from std_msgs.msg import Bool
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
import tf

class odomUpdater:

	def __init__(self,trueodomX=0,trueodomY=0,trueodomTheta=0):
		self.odomXrmp=0
		self.odomYrmp=0
		self.odomThetarmp=0
		self.trueodomX=trueodomX
		self.trueodomY=trueodomY
		self.trueodomTheta=trueodomTheta
		self.pose=Pose2D()
		self.odomRMP_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom)
		self.odom_pub = rospy.Publisher('odomUpdater', Pose2D, queue_size=10)
		s = rospy.Service('resetRMP_', resetRMP, handle_resetRMP)

	def handle_resetRMP(self, req):
		self.pose.x=req.pose.x
		self.pose.y=req.pose.y
		self.pose.theta=req.pose.theta


	def callbackOdom(self, data):

		#getting the false RMP odometry
		self.odomYrmp=data.pose.pose.position.y
		self.odomXrmp=data.pose.pose.position.x
		(roll, pitch, self.odomThetarmp) = tf.transformations.euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])


	def correctOdom(self):

		#updating it
		antX=self.odomXrmp
		antY=self.odomYrmp
		antTheta=self.odomThetarmp

		'''
		self.trueodomX+=(self.odomX-antX)
		self.trueodomY+=(self.odomY-antY)
		self.trueodomTheta+=(self.odomTheta-antTheta)
		'''

		self.pose.x+=(self.odomXrmp-antX)
		self.pose.y+=(self.odomYrmp-antY)
		self.pose.theta+=(self.odomThetarmp-antTheta)

		rospy.loginfo(pose)
		self.odom_pub.publish(self.pose)


		print"ODOM xRMP:%f yRMP:%f thetaRMP:%f"% (self.odomX,self.odomY,self.odomTheta)
		#print"ODOM x:%f y:%f theta:%f"% (self.trueodomX,self.trueodomY,self.trueodomTheta)
		print"ODOM x:%f y:%f theta:%f"% (self.pose.x,self.pose.y,self.pose.theta)


if __name__ == "__main__":
	rospy.init_node("odomUpdater_node",anonymous=True)
	print "entrou updater"
	update=odomUpdater()

	while not rospy.is_shutdown():
		try:
			update.correctOdom()
		except rospy.ROSInterruptException:
			pass



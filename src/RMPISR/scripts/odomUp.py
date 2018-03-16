#!/usr/bin/env python
import sys
import rospy
from RMPISR.srv import resetrmp
from geometry_msgs.msg import Pose2D
from nav_msgs.msg import Odometry
import tf

class odomUpdater:

	def __init__(self,trueodomX=0.22,trueodomY=0.33,trueodomTheta=0.314):
		self.odomXrmp=0
		self.odomYrmp=0
		self.odomThetarmp=0
		self.pose=Pose2D()
		self.pose.x=trueodomX
		self.pose.y=trueodomY
		self.pose.theta=trueodomTheta
		self.odomRMP_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom)
		self.odom_pub = rospy.Publisher('odomUpdater', Pose2D, queue_size=10)
		self.service = rospy.Service('resetRMP', resetrmp, self.handle_resetRMP)

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

		#rospy.loginfo(self.pose)
		self.odom_pub.publish(self.pose)


		print"Fake xRMP:%f yRMP:%f thetaRMP:%f"% (self.odomXrmp,self.odomYrmp,self.odomThetarmp)
		#print"ODOM x:%f y:%f theta:%f"% (self.trueodomX,self.trueodomY,self.trueodomTheta)
		print"Real x:%f y:%f theta:%f"% (self.pose.x,self.pose.y,self.pose.theta)


if __name__ == "__main__":
	rospy.init_node("odomUpdater_node",anonymous=True)
	print "entrou updater"
	update=odomUpdater()

	while not rospy.is_shutdown():
		try:
			update.correctOdom()
		except rospy.ROSInterruptException:
			pass



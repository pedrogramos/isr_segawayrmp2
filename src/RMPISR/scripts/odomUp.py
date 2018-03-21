#!/usr/bin/env python
import sys
import rospy
from RMPISR.srv import resetrmp
from geometry_msgs.msg import Pose2D
from nav_msgs.msg import Odometry
import tf
from turtlesim.msg import Pose

PI=3.14159265359

class odomUpdater:

	def __init__(self,trueodomX=0.0,trueodomY=0.0,trueodomTheta=0.0):
		self.trueodomX = trueodomX
		self.trueodomY = trueodomY
		self.trueodomTheta = trueodomTheta
		self.odomXrmp = 0
		self.odomYrmp = 0
		self.odomThetarmp = 0
		self.save=True
		#self.pose=Pose2D()
		self.pose=Pose()
		#self.odomRMP_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom)
		self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		#self.odom_pub = rospy.Publisher('odomUpdater', Pose2D, queue_size=10)
		self.odom_pub = rospy.Publisher('odomUpdater', Pose, queue_size=10)
		self.service = rospy.Service('resetRMP', resetrmp, self.handle_resetRMP)

	def handle_resetRMP(self, req):
		self.pose.x=req.pose.x
		self.pose.y=req.pose.y
		self.pose.theta=req.pose.theta


	def callbackOdom(self, data):

		#guarda a primeira posicao do robo para depois utilizar 
		#no calculo do deslocamento
		if(self.save == True):
			self.iniXrmp = data.x
			self.iniYrmp = data.y
			self.iniThetarmp = data.theta
			self.save = False


		self.odomXrmp = data.x
		self.odomYrmp = data.y
		self.odomThetarmp = data.theta 

		#getting the false RMP odometry
		#self.odomYrmp=data.pose.pose.position.y
		#self.odomXrmp=data.pose.pose.position.x
		#(roll, pitch, self.odomThetarmp) = tf.transformations.euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])


	def correctOdom(self):

		if (self.pose.theta > 2*PI):
			self.pose.theta=self.pose.theta - 2*PI

		self.pose.x = self.trueodomX + (self.odomXrmp - self.iniXrmp)
		self.pose.y = self.trueodomY + (self.odomYrmp - self.iniYrmp)
		self.pose.theta = self.trueodomTheta + (self.odomThetarmp - self.iniThetarmp)

		#rospy.loginfo(self.pose)
		self.odom_pub.publish(self.pose)


		#inicial
		print "INITIAL: X: %f Y: %f Theta: %f" % (self.iniXrmp,self.iniYrmp,self.iniThetarmp)
		#odom proveniente do robot
		print "FAKE: xRMP:%f yRMP:%f thetaRMP:%f"% (self.odomXrmp,self.odomYrmp,self.odomThetarmp)
		#odom que eu estou a calcular
		print "REAL: x:%f y:%f theta:%f"% (self.pose.x,self.pose.y,self.pose.theta)
 
	'''
	def correctOdom(self):

		#updating it
		antX=self.odomXrmp
		antY=self.odomYrmp
		antTheta=self.odomThetarmp

		print"Fake1 xRMP:%f yRMP:%f thetaRMP:%f" % (self.odomXrmp,self.odomYrmp,self.odomThetarmp)
		print"antX:%f antY:%f antTheta:%f" % (antX,antY,antTheta)

	
		self.trueodomX+=(self.odomX-antX)
		self.trueodomY+=(self.odomY-antY)
		self.trueodomTheta+=(self.odomTheta-antTheta)
	

		if (self.pose.theta > 2*PI):
			self.pose.theta=self.pose.theta - 2*PI

		self.pose.x = self.pose.x + (self.odomXrmp - antX)
		self.pose.y = self.pose.y + (self.odomYrmp - antY)
		self.pose.theta = self.pose.theta + (self.odomThetarmp - antTheta)

		#rospy.loginfo(self.pose)
		self.odom_pub.publish(self.pose)


		print"Fake2 xRMP:%f yRMP:%f thetaRMP:%f"% (self.odomXrmp,self.odomYrmp,self.odomThetarmp)
		#print"ODOM x:%f y:%f theta:%f"% (self.trueodomX,self.trueodomY,self.trueodomTheta)
		print"Real x:%f y:%f theta:%f"% (self.pose.x,self.pose.y,self.pose.theta)
	'''
	

if __name__ == "__main__":
	rospy.init_node("odomUpdater_node",anonymous=True)
	print "entrou updater"
	update=odomUpdater()
	rospy.sleep(2)

	while not rospy.is_shutdown():
		try:
			update.correctOdom()
		except rospy.ROSInterruptException:
			pass



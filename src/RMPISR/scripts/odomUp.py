#!/usr/bin/env python
import sys
import rospy
from RMPISR.srv import *
from geometry_msgs.msg import Pose2D
from nav_msgs.msg import Odometry
import tf
from turtlesim.msg import Pose
import time

PI=3.14159265359
PI_2=6.28318530718

class odomUpdater:

	def __init__(self,trueodomX=0.0,trueodomY=0.0,trueodomTheta=0.0):
		self.trueodomX = trueodomX
		self.trueodomY = trueodomY
		self.trueodomTheta = trueodomTheta
		self.odomXrmp = 0
		self.odomYrmp = 0
		self.odomThetarmp = 0
		self.iniXrmp=0
		self.iniYrmp=0
		self.iniThetarmp=0
		self.save=True
		self.pose=Pose2D()
		#self.pose=Pose()
		self.odomRMP_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom)
		#self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		self.odom_pub = rospy.Publisher('odomUpdater', Pose2D, queue_size=10)
		#self.odom_pub = rospy.Publisher('odomUpdater', Pose, queue_size=10)
		self.service = rospy.Service('resetRMP', resetrmp, self.handle_resetRMP)
		

	def handle_resetRMP(self,req):
		
		#geometry_msgs/Pose2D pose
		self.trueodomX=req.pose.x
		self.trueodomY=req.pose.y
		self.trueodomTheta=req.pose.theta

		self.save=True
		'''
		file=open("testfile.txt","a+")
		file.write("Hello World\n")
		#file.write(time.strftime('%a, %d %b %Y %H:%M:%S GMT \n', time.localtime()))
		file.close()
		'''
		
		print time.strftime('%a, %d %b %Y %H:%M:%S GMT \n', time.localtime())
		print "X: %f Y: %f th: %f" % (self.trueodomX,self.trueodomY,self.trueodomTheta)

		'''
		with open('somefile.txt', 'a') as the_file:
   			the_file.write(time.strftime('%a, %d %b %Y %H:%M:%S GMT \n', time.localtime()))
		'''
   		
		

		return []





	'''
	#para a turtle
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
	'''

	def callbackOdom(self, data):

		#guarda a primeira posicao do robo para depois utilizar no calculo do deslocamento
		#a variavel safe e usada para quando o robo chega a uma posicao conhecida fazer o reset dessa posicao inicialmente guardada
		if(self.save == True):
			self.iniXrmp = data.pose.pose.position.x
			self.iniYrmp = data.pose.pose.position.y
			(roll, pitch, self.iniThetarmp) = tf.transformations.euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])
			self.save = False

		#getting the false RMP odometry
		self.odomXrmp=data.pose.pose.position.x
		self.odomYrmp=data.pose.pose.position.y
		(roll, pitch, self.odomThetarmp) = tf.transformations.euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])

	def correctOdom(self):

		if (self.pose.theta > PI_2):
			self.pose.theta=self.pose.theta - PI_2
		elif (self.pose.theta < PI_2):
			self.pose.theta=self.pose.theta + PI_2

		self.pose.x = self.trueodomX + (self.odomXrmp - self.iniXrmp)
		self.pose.y = self.trueodomY + (self.odomYrmp - self.iniYrmp)
		self.pose.theta = self.trueodomTheta + (self.odomThetarmp - self.iniThetarmp)

		#rospy.loginfo(self.pose)
		self.odom_pub.publish(self.pose)

	def printScreen(self):
		#minha posicao
		print "MyOwn: X: %f Y: %f Theta: %f" % (self.trueodomX,self.trueodomY,self.trueodomTheta) 
		#inicial
		print "INITIAL: X: %f Y: %f Theta: %f" % (self.iniXrmp,self.iniYrmp,self.iniThetarmp)
		#odom proveniente do robot
		print "FAKE: xRMP:%f yRMP:%f thetaRMP:%f"% (self.odomXrmp,self.odomYrmp,self.odomThetarmp)
		#odom que eu estou a calcular
		print "REAL: x:%f y:%f theta:%f"% (self.pose.x,self.pose.y,self.pose.theta)
 
if __name__ == "__main__":
	rospy.init_node("odomUpdater_node",anonymous=True)
	print "Odom Updater Initialization ..."
	update=odomUpdater()
	rospy.sleep(1)
	print "Done!"

	while not rospy.is_shutdown():
		try:
			update.correctOdom()
			#update.printScreen()

		except rospy.ServiceException, e:
			print "correctOdom function call failed: %s" % e

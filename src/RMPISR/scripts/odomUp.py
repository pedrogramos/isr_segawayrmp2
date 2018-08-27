#!/usr/bin/env python
import sys
import rospy
from RMPISR.srv import *
from geometry_msgs.msg import Pose2D
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
import tf
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
		self.odomNew = Pose2D()
		self.error = Pose2D()
		self.error.x = 0
		self.error.y = 0
		self.error.theta = 0
		#self.pose=Pose()
		self.odomRMP_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom) #odom do segway
		#self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		self.odom_pub = rospy.Publisher('odomUpdater', Pose2D, queue_size=10) #incremento da odom do segway
		self.new_odom_pub = rospy.Publisher('new_odom',Pose2D, queue_size=10) #odom + error
		#self.odom_pub = rospy.Publisher('odomUpdater', Pose, queue_size=10)
		self.service = rospy.Service('resetRMP', resetrmp, self.handle_resetRMP) #server servico para posicao inicial
		self.service2 = rospy.Service('odomError',odomError,self.handle_odomError) #server servico para receber o erro
		

	#servico usado para estabelecer a posicao inicial do robo
	#servidor
	def handle_resetRMP(self,req):
		
		#geometry_msgs/Pose2D pose
		self.trueodomX=req.pose.x
		self.trueodomY=req.pose.y
		self.trueodomTheta=req.pose.theta

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


	def handle_odomError(self,req):


		self.error.x = req.pose.x - self.pose.x;
		self.error.y = req.pose.y - self.pose.y;
		self.error.theta = req.pose.theta - self.pose.theta;


		print "\nError service received."
		print "Pose marker X: ", req.pose.x," Y: ", req.pose.y, " Th: ", req.pose.theta
		print "Odom X: ", self.pose.x ," Y: ", self.pose.y , " Th: ", self.pose.theta
		print "Error X: ", self.error.x, " Y: ", self.error.y, "Th: ", self.error.theta


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

		'''
		if (self.pose.theta > PI_2):
			self.pose.theta=self.pose.theta - PI_2
		
		elif (self.pose.theta < 0):
			self.pose.theta=self.pose.theta + PI_2
		'''
		
		self.pose.x = self.trueodomX + (self.odomXrmp - self.iniXrmp)
		self.pose.y = self.trueodomY + (self.odomYrmp - self.iniYrmp)
		self.pose.theta = self.trueodomTheta + (self.odomThetarmp - self.iniThetarmp)
		
		'''
		self.pose.x=self.odomXrmp
		self.pose.y=self.odomYrmp
		self.pose.theta=self.odomThetarmp
		'''
		#rospy.loginfo(self.pose)
		self.odom_pub.publish(self.pose)




	def correctOdomPlusError(self):

		self.odomNew.x = self.pose.x + self.error.x;
		self.odomNew.y = self.pose.y + self.error.y;
		self.odomNew.theta = self.pose.theta + self.error.theta;

		self.new_odom_pub.publish(self.odomNew);


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
			update.correctOdomPlusError()
			#update.printScreen()

		except rospy.ServiceException, e:
			print "correctOdom function call failed: %s" % e

#!/usr/bin/env python
import sys
import rospy
from RMPISR.srv import *
from geometry_msgs.msg import Pose2D
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
from std_msgs.msg import Float32MultiArray
import tf
import time
import numpy as np

PI=3.14159265359
PI_2=6.28318530718

class odomUpdater:

	def __init__(self):
		self.odomXrmp = self.odomYrmp = self.odomThetarmp = 0
		self.segway_M = self.inv_segway_M = np.zeros((4, 4))
		self.save=False
		self.pose=Pose2D()
		self.odomNew = Pose2D()
		self.segway2 = Pose2D()
		self.wTr_begin = np.zeros((4, 4))
		self.wTr_update = np.zeros((4, 4))
		self.wTo = np.zeros((4, 4))
		self.wTo_marker = np.zeros((4, 4))
		#self.pose=Pose()
		self.odomRMP_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom) #odom do segway
		#self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		self.odom_pub = rospy.Publisher('odomUpdater', Pose2D, queue_size=1) #incremento da odom do segway
		self.new_odom_pub = rospy.Publisher('new_odom',Pose2D, queue_size=1) #odom + error
		#self.odom_pub = rospy.Publisher('odomUpdater', Pose, queue_size=10)
		self.service = rospy.Service('resetRMP', resetrmp, self.handle_resetRMP) #server servico para posicao inicial
		self.service2 = rospy.Service('odomError',odomError,self.handle_odomError) #server servico para receber o erro

#---------------------------------------------------------------------------------------------------------------------------#

	#servico usado para estabelecer a posicao inicial do robo
	#servidor
	def handle_resetRMP(self,req):
		array1 = Float32MultiArray()
		array1.data = []
		#recebo a matriz da posicao inicial para calcular a odometria que o segway me devia dar
		array1.data = req.pose.data

		#matriz arranjada do array recebido
		#inicialmente ficam as duas iguais, ate receber o servico do update
		self.wTr_begin = np.array([(array1.data[0],array1.data[4],array1.data[8],array1.data[12]/1000),(array1.data[1],array1.data[5],array1.data[9],array1.data[13]/1000),(array1.data[2],array1.data[6],array1.data[10],array1.data[14]/1000),(array1.data[3],array1.data[7],array1.data[11],array1.data[15])])
		self.wTo_marker = self.wTo = np.dot(self.wTr_begin,self.inv_segway_M)

		print "Posicao Inicial Recebida Com Sucesso!"
		print self.wTr_begin
		
		return []

#---------------------------------------------------------------------------------------------------------------------------#

	def handle_odomError(self,req):
		array1 = Float32MultiArray()
		array1.data = []
		#criar wTr_update a partir da pose recebida
		array1.data = req.pose.data

		#matriz arranjada do array recebido
		self.wTr_update = np.array([(array1.data[0],array1.data[4],array1.data[8],array1.data[12]/1000),(array1.data[1],array1.data[5],array1.data[9],array1.data[13]/1000),(array1.data[2],array1.data[6],array1.data[10],array1.data[14]/1000),(array1.data[3],array1.data[7],array1.data[11],array1.data[15])])
		self.wTo_marker=np.dot(self.wTr_update,self.inv_segway_M)

		#print a odom quando recebida a posicao do marcador
		print "\nActualizacao Da Posicao Recebida Com Sucesso"
		print "Segway2: X: %f Y: %f Theta: %f" % (self.segway2.x,self.segway2.y,self.segway2.theta)
		print self.wTr_update
		self.save = True


		return []

#---------------------------------------------------------------------------------------------------------------------------#

	#odom do segway
	def callbackOdom(self, data):

		#getting the false RMP odometry
		odomXrmp=data.pose.pose.position.x
		odomYrmp=data.pose.pose.position.y
		(roll, pitch, yaw) = tf.transformations.euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])

		#criar matriz a partir da odom recebida
		self.segway_M = tf.transformations.compose_matrix(angles=np.array([roll,pitch,yaw]),translate=np.array([odomXrmp,odomYrmp,0]))
		self.inv_segway_M = np.linalg.inv(self.segway_M)

#---------------------------------------------------------------------------------------------------------------------------#

	#odom como devia ver do segway
	def correctOdom(self):

		fake = np.dot(self.wTo,self.segway_M)
		(roll, pitch, self.segway2.theta) = tf.transformations.euler_from_matrix(fake)


		self.segway2.x = fake[0][3]
		self.segway2.y = fake[1][3]

		#rospy.loginfo(self.pose)
		self.odom_pub.publish(self.segway2)

#---------------------------------------------------------------------------------------------------------------------------#

	#odom corrigida pelos marcadores
	def correctOdomPlusError(self):

		odom_marker = np.dot(self.wTo_marker,self.segway_M)
		(roll, pitch, self.odomNew.theta) = tf.transformations.euler_from_matrix(odom_marker)


		self.odomNew.x = odom_marker[0][3]
		self.odomNew.y = odom_marker[1][3]

		if(self.save):
			print "Real Odom: X: %f Y: %f Theta: %f" % (self.odomNew.x,self.odomNew.y,self.odomNew.theta)
			print "\n\n"
			self.save = False

		self.new_odom_pub.publish(self.odomNew);

#---------------------------------------------------------------------------------------------------------------------------#

if __name__ == "__main__":
	rospy.init_node("odomUpdater_node",anonymous=True)
	print "Odom Updater Initialization ..."
	update=odomUpdater()
	rospy.sleep(1)
	print "Done!"
	rate = rospy.Rate(50)
	while not rospy.is_shutdown():

		update.correctOdom()
		update.correctOdomPlusError()
		#update.printScreen()
		rate.sleep()

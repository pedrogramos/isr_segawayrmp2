#!/usr/bin/env python
import rospy
import sys
import math
from geometry_msgs.msg import Point, Pose2D
from rosserial_arduino import sensors
from perception_pkg.srv import *


PI = 3.14159265359
#angulos dos sensores relativamente ao centro do robo
ir1_th = 
ir2_th =
ir3_th =
ir4_th =

#ganhos para cada um dos sensores
k1 = 
k2 = 
k3 = 
k5 = 



class Perception():

	def __init__(self):

		self.sensor_sub = rospy.Subscriber('/sensorArray', sensors, self.callbackSensors)
		self.new_odom_sub = rospy.Subscriber('/new_odom',Pose2D,self.callbackOdom)
		#self.repulsive = rospy.Publisher('repulsive_vec',)



	def callbackSensors(self,data):
		self.ir1 = data.ir1
		self.s1 = data.s1
		self.ir2 = data.ir2
		self.s2 = data.s2
		self.ir3 = data.ir3
		self.ir4 = data.ir4
		self.s5 = data.s5

	def callbackOdom(self,data):
		self.odomX=data.x
		self.odomY=data.y
		self.odomTheta=data.theta

	def obstacleAdd_client(self):
	rospy.wait_for_service('stop')
	try:
		obs_add = rospy.ServiceProxy('add_obstacle', add_obstacle)
		resp1 = obs_add.call()
		self.state=resp1.state
		print "Obstacle Detected. Informing coordinator."

	except rospy.ServiceException, e:
		print "Stop Service call failed: %s" % e



	#funcao para criar o vector a partir da distancia
	def createVectors():
		#cos(self.odomTheta+Pi+Pi/2)
		self.x2_ir1 = (k1 / self.ir1) * cos() + self.odomX
		self.y2_ir1 = (k1 / self.ir1) * cos(ir1_th) + self.odomY

		self.x2_s1 = (k1 / self.s1) * cos(self.odomTheta+4.712) + self.odomX
		self.y2_s1 = (k1 / self.s1) * cos(ir1_th) + self.odomY

		self.x2_ir2 = (k2 / self.ir2) * cos(ir2_th) + self.odomX
		self.y2_ir2 = (k2 / self.ir2) * cos(ir2_th) + self.odomY

		self.x2_s2 = (k2 / self.s2) * cos(ir2_th) + self.odomX
		self.y2_s2 = (k2 / self.s2) * cos(ir2_th) + self.odomY

		self.x2_ir3 = (k3 / self.ir3) * cos(ir3_th) + self.odomX
		self.y2_ir3 = (k3 / self.ir3) * cos(ir3_th) + self.odomY

		self.x2_ir4 = (k4 / self.ir4) * cos(ir4_th) + self.odomX
		self.y2_ir4 = (k4 / self.ir4) * cos(ir4_th) + self.odomY

		self.x2_s5 = (k5 / self.s5) * cos(self.odomTheta+PI) + self.odomX
		self.y2_s5 = (k5 / self.s5) * cos(self.odomTheta+PI) + self.odomY

#---------------------------------------------------------------------------------------------------------------------------#


	#escolher segundo a odometria o sensor mais adequado a usar
	def chooseSensor():

		#se resumir o robo a um ponto e esse ponto estiver dentro da area de um rectangulo
		if (self.odomX == and self.odomY == and self.odomTheta == ):
			self.x2_ir1=self.x2_ir2=self.x2_ir3=self.x2_ir4=0

		else:
			self.x2_s1=self.x2_s2=0


#---------------------------------------------------------------------------------------------------------------------------#


	#funcao para fazer a soma de todos os vectores repulsivos	
	def sumVectors():
		self.xres = self.x2_s5 + self.x2_ir4 + self.x2_ir3 + self.x2_s2 + self.x2_ir2 + self.x2_s1 + self.x2_ir1

		self.yres = self.y2_s5 + self.y2_ir4 + self.y2_ir3 + self.y2_s2 + self.y2_ir2 + self.y2_s1 + self.y2_ir1

		#enviar o resultado final através de um serviço para o CGP.cpp











'''
--> enviar serviço ao coordinator com a posição do objecto a adicionar ao mapa
--> ter em atenção que em casos extremos a soma deve eliminar por completo o contributo da atractiva


'''


if __name__ == "__main__":
	rospy.init_node("perception_node",anonymous=True)
	print "Perception node is Initializing..."
	see=Perception()
	print "Ready!"


	rate = rospy.Rate(5)
	while not rospy.is_shutdown():
		see.createVectors()
		see.chooseSensor()
		see.sumVectors()



		rate.sleep()

	except (KeyboardInterrupt, SystemExit, rospy.is_shutdown()):
		sys.exit()

	#rospy.spin()

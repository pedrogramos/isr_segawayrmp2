#!/usr/bin/env python

import rospy
import sys
import math
from geometry_msgs.msg import Point, Pose2D
#from rosserial_arduino import sensors
from perception_pkg.srv import *



class Perception():

	def __init__(self):

		self.sensor_sub = rospy.Subscriber('/sensorArray', sensors, self.callbackSensors)
		self.new_odom_sub = rospy.Subscriber('/new_odom',Pose2D,self.callbackOdom)
		self.repulsive = rospy.Publisher('repulsive_vec',Point, queue_size=10)
		self.final_vector = Point()



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

	def obstacleAdd_client(self, xobs, yobs):
		rospy.wait_for_service('add_obstacle')
		try:
			obs_add = rospy.ServiceProxy('add_obstacle', add_obstacle)
			obs_add.call(xobs, yobs) #obs_add(xobs,yobs)
			print "Obstacle Detected. Informing coordinator."

		except rospy.ServiceException, e:
			print "Adding obstacle service call failed: %s" % e



	#funcao para criar o vector a partir da distancia
	def createVectors():
		#cos(self.odomTheta+Pi+Pi/2)
		self.x2_ir1 = (k1 / self.ir1) * cos(self.odomTheta+4.712) + self.odomX
		self.y2_ir1 = (k1 / self.ir1) * cos(self.odomTheta+4.712) + self.odomY

		self.x2_s1 = (k1 / self.s1) * cos(self.odomTheta+4.712) + self.odomX
		self.y2_s1 = (k1 / self.s1) * cos(self.odomTheta+4.712) + self.odomY

		self.x2_ir2 = (k2 / self.ir2) * cos(self.odomTheta+1.571) + self.odomX
		self.y2_ir2 = (k2 / self.ir2) * cos(self.odomTheta+1.571) + self.odomY

		self.x2_s2 = (k2 / self.s2) * cos(self.odomTheta+1.571) + self.odomX
		self.y2_s2 = (k2 / self.s2) * cos(self.odomTheta+1.571) + self.odomY

		self.x2_ir3 = (k3 / self.ir3) * cos(self.odomTheta+2.356) + self.odomX
		self.y2_ir3 = (k3 / self.ir3) * cos(self.odomTheta+2.356) + self.odomY

		self.x2_ir4 = (k4 / self.ir4) * cos(self.odomTheta+3.927) + self.odomX
		self.y2_ir4 = (k4 / self.ir4) * cos(self.odomTheta+3.927) + self.odomY

		self.x2_s5 = (k5 / self.s5) * cos(self.odomTheta+math.pi) + self.odomX
		self.y2_s5 = (k5 / self.s5) * cos(self.odomTheta+math.pi) + self.odomY

#---------------------------------------------------------------------------------------------------------------------------#


	#escolher segundo a odometria o sensor mais adequado a usar
	def chooseSensor():

		#se resumir o robo a um ponto e esse ponto estiver dentro da area de um rectangulo
		#primeiras janelas ao pe da secretaria
		if ((minx <= self.odomX <= maxx) and (miny <= self.odomY <= maxy)):
			self.x2_ir1=self.x2_ir2=self.x2_ir3=self.x2_ir4=0

		#janelas ao pe do auditorio
		#adicionar o theta porque so existem vidracas de um dos lados
		elif ((minx <= self.odomX <= maxx) and (miny <= self.odomY <= maxy)):
			#if(self.odomTheta == )
			self.x2_ir1=self.x2_ir2=self.x2_ir3=self.x2_ir4=0

		else:
			self.x2_s1=self.x2_s2=0


#---------------------------------------------------------------------------------------------------------------------------#


	#funcao para fazer a soma de todos os vectores repulsivos	
	def sumVectors():
		self.final_vector.x = self.x2_s5 + self.x2_ir4 + self.x2_ir3 + self.x2_s2 + self.x2_ir2 + self.x2_s1 + self.x2_ir1

		self.final_vector.y = self.y2_s5 + self.y2_ir4 + self.y2_ir3 + self.y2_s2 + self.y2_ir2 + self.y2_s1 + self.y2_ir1

		self.repulsive.publish(self.final_vector)









'''
--> enviar servico ao coordinator com a posicao do objecto a adicionar ao mapa
--> ter em atencao que em casos extremos a soma deve eliminar por completo o contributo da atractiva


'''


if __name__ == "__main__":
	rospy.init_node("perception_node",anonymous=True)
	print "Perception node is Initializing..."
	see=Perception()
	print "Ready!"


	rate = rospy.Rate(5)
	while not rospy.is_shutdown():

		try:
			see.createVectors()
			see.chooseSensor()
			see.sumVectors()



			rate.sleep()

		except (KeyboardInterrupt, SystemExit):
			sys.exit()

	#rospy.spin()

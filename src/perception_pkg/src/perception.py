#!/usr/bin/env python
import rospy
import sys
import numpy as np
import math
from geometry_msgs.msg import Point, Pose2D
from rosserial_arduino import sensors

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

	#funcao para criar o vector a partir da distancia
	def createVectors():

	#funcao para fazer a soma de todos os vectores repulsivos	
	def sumVectors():


	#funcao para segundo a odometria escolher o sensor mais adequado a usar
	def chooseSensor():
		'''
		se for zona de vidro = 0 o IR
		se for zona normal = 0 o sonar
		'''




#!/usr/bin/env python

import rospy
import sys
import math
import matplotlib.pyplot as plt
from geometry_msgs.msg import Point, Pose2D
from RMPISR.msg import sensors
from perception_pkg.srv import *
import csv

#to launch the arduino rospy
#ls -l /dev/ttyACM*
#sudo chmod a+rw /dev/ttyACM0
#rosrun rosserial_python serial_node.py /dev/ttyACM0
#rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0 _baud:=115200

#rosbag
#rosbag record -a

n_sensors = 7

'''
k1 = gain1 = 0.1
k12 = gain11 = 0.1
k2 = gain2 = 0.1
k22 = gain22 = 0.1
k3 = gain3 = 0.1
k4 = gain4 = 0.1
k5 = gain5 = 0.15
'''
k1=k12=k2=k22=k3=k4=k5=0.3


#definicao das distancias a partir das quais o calculo de vectores deve ser feito
left = right = 0.42
fleft = fright = 0.42
front = 0.2

class Perception():

	def __init__(self):

		self.sensor_sub = rospy.Subscriber('/sensorArray', sensors, self.callbackSensors)
		self.new_odom_sub = rospy.Subscriber('/new_odom',Pose2D,self.callbackOdom)
		self.repulsive = rospy.Publisher('repulsive_vec',Point, queue_size=10)
		self.final_vector = Point()
		self.sensorValues = sensors()
		self.values = []
		self.vectores = []
		self.odomX = 0
		self.odomY = 0
		self.odomTheta = 0


	#obter a informacao sensorial
	def callbackSensors(self,data):
		self.sensorValues = data
		#print "\n", self.sensorValues

		#odom ja corrigida com o erro
	def callbackOdom(self,data):
		self.odomX=data.x
		self.odomY=data.y
		self.odomTheta=data.theta



#---------------------------------------------------------------------------------------------------------------------------#
	
	#servico que deve ser chamado aquando de o s5 der um valor em que a fuga ja nao seja possivel
	#deve entao ser adicionado ao actual mapa um objecto que permita que o planeador calcule
	#novamente uma nova rota
	'''
	def obstacleAdd_client(self, xobs, yobs):
		rospy.wait_for_service('add_obstacle')
		try:
			obs_add = rospy.ServiceProxy('add_obstacle', add_obstacle)
			obs_add.call(xobs, yobs) #obs_add(xobs,yobs)
			#caso de erro tenho de por uma variavel para fazer return da call do servico
			print "Obstacle Detected. Informing coordinator."

		except rospy.ServiceException, e:
			print "Adding obstacle service call failed: %s" % e

	'''
#---------------------------------------------------------------------------------------------------------------------------#
	'''
	def testeValues():

		self.sensorValues.ir1 = 0.6
		self.sensorValues.s1 = 2.00
		self.sensorValues.ir2 = 
		self.sensorValues.s2 = 
		self.sensorValues.ir3 = 
		self.sensorValues.ir4 = 
		self.sensorValues.s5 = 
	'''

#---------------------------------------------------------------------------------------------------------------------------#
	
	
	#escolher segundo a odometria o sensor mais adequado a usar por causa dos vidros
	#alterar os k para zero em vez dos valores dos sensores
	def chooseSensor(self):

		#se resumir o robo a um ponto e esse ponto estiver dentro da area de um rectangulo
		#primeiras janelas ao pe da secretaria
		if ((9.163 <= self.odomX <= 14.163) and (5.8 <= self.odomY <= 7.5)):
			print "\nEstou nas vidracas da contabilidade"
			self.sensorValues.ir1 = self.sensorValues.ir2 = self.sensorValues.ir3 = self.sensorValues.ir4 = 0
			#ganhos dos sonares

			
		#entrada ISR, mas depende da orientacao
		elif ((0 <= self.odomX <= 5) and (0 <= self.odomY <= 5)):
			if  (-0.3 <= self.odomTheta <= 0.3):
				print "\nTenho as vidracas da entrada do meu lado direito"
				self.sensorValues.ir2 = self.sensorValues.ir3 = 0


			elif ( math.pi-0.3 <= self.odomTheta <= math.pi+0.3):
				print "\nTenho as vidracas da entrada do meu lado esquerdo"
				self.sensorValues.ir1 = self.sensorValues.ir4 = 0


		#restante mapa
		else:
			print "Resto do mapa"
			#no resto do mapa nao quero usar os valores dos sonares
			self.sensorValues.s2 = self.sensorValues.s1 = 0

		


#---------------------------------------------------------------------------------------------------------------------------#

	#funcao para calcular o vector c dir inversa a partir da distancia proveniente dos sensores
	#ja tem em atencao que so calcula o vetor quando a distancia e inferior a um determinado limiar
	def calculateEndPoint(self):
		toappend = Point()

		if ( 0.2 <= self.sensorValues.ir1 <= left):
			#cos(self.odomTheta+Pi+Pi/2)
			toappend.x = self.x2_ir1 = (k1 / self.sensorValues.ir1) * math.cos(self.odomTheta+4.712) + self.odomX
			toappend.y = self.y2_ir1 = (k1 / self.sensorValues.ir1) * math.sin(self.odomTheta+4.712) + self.odomY
			self.values.append(toappend)
			print "calculate ir1: ", self.sensorValues.ir1

		if ( 0.1 <= self.sensorValues.s1 <= left):
			toappend.x = self.x2_s1 = (k12 / self.sensorValues.s1) * math.cos(self.odomTheta+4.712) + self.odomX
			toappend.y = self.y2_s1 = (k12 / self.sensorValues.s1) * math.sin(self.odomTheta+4.712) + self.odomY
			self.values.append(toappend)
			print "calculate s1: ", self.sensorValues.s1

		if( 0.2 <= self.sensorValues.ir2 <= right):
			toappend.x = self.x2_ir2 = (k2 / self.sensorValues.ir2) * math.cos(self.odomTheta+1.571) + self.odomX
			toappend.y = self.y2_ir2 = (k2 / self.sensorValues.ir2) * math.sin(self.odomTheta+1.571) + self.odomY
			self.values.append(toappend)
			print "calculate ir2: ", self.sensorValues.ir2

		if( 0.1 <= self.sensorValues.s2 <= right):
			toappend.x = self.x2_s2 = (k22 / self.sensorValues.s2) * math.cos(self.odomTheta+1.571) + self.odomX
			toappend.y = self.y2_s2 = (k22 / self.sensorValues.s2) * math.sin(self.odomTheta+1.571) + self.odomY
			self.values.append(toappend)
			print "calculate s2: ", self.sensorValues.s2

		if( 0.2 <= self.sensorValues.ir3 <= fleft):
			toappend.x = self.x2_ir3 = (k3 / self.sensorValues.ir3) * math.cos(self.odomTheta+2.356) + self.odomX
			toappend.y = self.y2_ir3 = (k3 / self.sensorValues.ir3) * math.sin(self.odomTheta+2.356) + self.odomY
			self.values.append(toappend)
			print "calculate ir3: ", self.sensorValues.ir3

		if( 0.2 <= self.sensorValues.ir4 <= fright):
			toappend.x = self.x2_ir4 = (k4 / self.sensorValues.ir4) * math.cos(self.odomTheta+3.927) + self.odomX
			toappend.y = self.y2_ir4 = (k4 / self.sensorValues.ir4) * math.sin(self.odomTheta+3.927) + self.odomY
			self.values.append(toappend)
			print "calculate ir4: ", self.sensorValues.ir4
		
		if( 0.1 <= self.sensorValues.s5 <= front):
			toappend.x = self.x2_s5 = (k5 / self.sensorValues.s5) * math.cos(self.odomTheta+math.pi) + self.odomX
			toappend.y = self.y2_s5 = (k5 / self.sensorValues.s5) * math.sin(self.odomTheta+math.pi) + self.odomY
			self.values.append(toappend)
			print "calculate s5: ", self.sensorValues.s5
		

		print "list size EndPoint: ", len(self.values)



#---------------------------------------------------------------------------------------------------------------------------#

	def createVectors(self):

		toappend = Point()
		for i in xrange(len(self.values)):
			
			toappend.x = (self.values[i].x - self.odomX)
			toappend.y = (self.values[i].y - self.odomY)
			self.vectores.append(toappend)

		print "list size createVectors: ", len(self.vectores)

#---------------------------------------------------------------------------------------------------------------------------#


	#funcao para fazer a soma de todos os vectores repulsivos	
	def sumVectors(self):
		self.final_vector.x = 0
		self.final_vector.y = 0

		print "final_vector ini: ", self.final_vector

		for i in xrange(len(self.vectores)):
			self.final_vector.x += self.vectores[i].x
			self.final_vector.y += self.vectores[i].y

		self.repulsive.publish(self.final_vector)

		
		dx = self.final_vector.x + self.odomX
		dy = self.final_vector.y + self.odomY
		'''
		with open('repulse.txt', 'a') as the_file:
		    the_file.write('%f, %f\n' % (dx),(dy))
		'''
		myData =  [dx,dy]
 
		with open('repulse.csv', 'a') as myFile:
		    writer = csv.writer(myFile)
		    writer.writerow(myData)

		self.vectores = []
		self.values = []
		print "final_vector: ", self.final_vector



#---------------------------------------------------------------------------------------------------------------------------#
'''	
	def representVectors():

		plt.figure()
		plt.quiver()

		plt.draw()
		plt.show()

'''


'''
--> enviar servico ao coordinator com a posicao do objecto a adicionar ao mapa
--> ter em atencao que em casos extremos a soma deve eliminar por completo o contributo da atractiva


'''


if __name__ == "__main__":
	rospy.init_node("perception_node",anonymous=True)
	print "Perception node is Initializing..."
	see=Perception()
	print "Ready!"


	rate = rospy.Rate(10)
	while not rospy.is_shutdown():

		try:
			see.chooseSensor()
			see.calculateEndPoint()
			see.createVectors()
			see.sumVectors()
			#see.representVectors()

			print "\n"



			rate.sleep()

		except (KeyboardInterrupt, SystemExit):
			sys.exit()

	#rospy.spin()

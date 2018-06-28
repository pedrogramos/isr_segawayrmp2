#!/usr/bin/env python

import rospy
import sys
import math
import matplotlib.pyplot as plt
from geometry_msgs.msg import Point, Pose2D
from RMPISR.msg import sensors
from perception_pkg.srv import *

#to launch the arduino rospy
#ls -l /dev/ttyACM*
#sudo chmod a+rw /dev/ttyACM0
#rosrun rosserial_python serial_node.py /dev/ttyACM0
#rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0 _baud:=115200

k1=40
k2=40
k3=40
k4=40
k5=30

#definicao das distancias a partir das quais o calculo de vectores deve ser feito
left = right = 40
fleft = fright = 40
front = 30

class Perception():

	def __init__(self):

		self.sensor_sub = rospy.Subscriber('/sensorArray', sensors, self.callbackSensors)
		self.new_odom_sub = rospy.Subscriber('/new_odom',Pose2D,self.callbackOdom)
		self.repulsive = rospy.Publisher('repulsive_vec',Point, queue_size=10)
		self.final_vector = Point()
		self.sensorValues = sensors()


	#obter a informacao sensorial
	def callbackSensors(self,data):
		self.sensorValues = data
		#print "\n", self.sensorValues

		#odom ja corrigida com o erro
	def callbackOdom(self,data):
		self.odomX=data.x
		self.odomY=data.y
		self.odomTheta=data.theta


'''
#---------------------------------------------------------------------------------------------------------------------------#

	#servico que deve ser chamado aquando de o s5 der um valor em que a fuga ja nao seja possivel
	#deve entao ser adicionado ao actual mapa um objecto que permita que o planeador calcule
	#novamente uma nova rota
	def obstacleAdd_client(self, xobs, yobs):
		rospy.wait_for_service('add_obstacle')
		try:
			obs_add = rospy.ServiceProxy('add_obstacle', add_obstacle)
			obs_add.call(xobs, yobs) #obs_add(xobs,yobs)
			#caso de erro tenho de por uma variavel para fazer return da call do servico
			print "Obstacle Detected. Informing coordinator."

		except rospy.ServiceException, e:
			print "Adding obstacle service call failed: %s" % e


#---------------------------------------------------------------------------------------------------------------------------#
	
	
	#escolher segundo a odometria o sensor mais adequado a usar por causa dos vidros
	#alterar os k para zero em vez dos valores dos sensores
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
			
		#entrada ISR, mas depende da orientacao
		elif

		else:
			self.x2_s1=self.x2_s2=0
		

'''
#---------------------------------------------------------------------------------------------------------------------------#

	#funcao para calcular o vector c dir inversa a partir da distancia proveniente dos sensores
	#ja tem em atencao que so calcula o vetor quando a distancia e inferior a um determinado limiar
	def createVectors():
		if (self.sensorValues.ir1 < left):
			#cos(self.odomTheta+Pi+Pi/2)
			self.x2_ir1 = (k1 / self.sensorValues.ir1) * cos(self.odomTheta+4.712) + self.odomX
			self.y2_ir1 = (k1 / self.sensorValues.ir1) * cos(self.odomTheta+4.712) + self.odomY

		if (self.sensorValues.s1 < left):
			self.x2_s1 = (k1 / self.sensorValues.s1) * cos(self.odomTheta+4.712) + self.odomX
			self.y2_s1 = (k1 / self.sensorValues.s1) * cos(self.odomTheta+4.712) + self.odomY

		if(self.sensorValues.ir2 < right):
			self.x2_ir2 = (k2 / self.sensorValues.ir2) * cos(self.odomTheta+1.571) + self.odomX
			self.y2_ir2 = (k2 / self.sensorValues.ir2) * cos(self.odomTheta+1.571) + self.odomY

		if(self.sensorValues.s2 < right):
			self.x2_s2 = (k2 / self.sensorValues.s2) * cos(self.odomTheta+1.571) + self.odomX
			self.y2_s2 = (k2 / self.sensorValues.s2) * cos(self.odomTheta+1.571) + self.odomY

		if(self.sensorValues.ir3 < fleft):
			self.x2_ir3 = (k3 / self.sensorValues.ir3) * cos(self.odomTheta+2.356) + self.odomX
			self.y2_ir3 = (k3 / self.sensorValues.ir3) * cos(self.odomTheta+2.356) + self.odomY

		if(self.sensorValues.ir4 < fright):
			self.x2_ir4 = (k4 / self.sensorValues.ir4) * cos(self.odomTheta+3.927) + self.odomX
			self.y2_ir4 = (k4 / self.sensorValues.ir4) * cos(self.odomTheta+3.927) + self.odomY

		if(self.sensorValues.s5 < front):
			self.x2_s5 = (k5 / self.sensorValues.s5) * cos(self.odomTheta+math.pi) + self.odomX
			self.y2_s5 = (k5 / self.sensorValues.s5) * cos(self.odomTheta+math.pi) + self.odomY



#---------------------------------------------------------------------------------------------------------------------------#


	#funcao para fazer a soma de todos os vectores repulsivos	
	def sumVectors():
		self.final_vector.x = self.x2_s5 + self.x2_ir4 + self.x2_ir3 + self.x2_s2 + self.x2_ir2 + self.x2_s1 + self.x2_ir1

		self.final_vector.y = self.y2_s5 + self.y2_ir4 + self.y2_ir3 + self.y2_s2 + self.y2_ir2 + self.y2_s1 + self.y2_ir1

		self.repulsive.publish(self.final_vector)


#---------------------------------------------------------------------------------------------------------------------------#
	def representVectors():

		plt.figure()
		plt.quiver()

		plt.draw()
		plt.show()












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
			#see.chooseSensor()
			#see.createVectors()
			#see.sumVectors()
			#see.representVectors()



			rate.sleep()

		except (KeyboardInterrupt, SystemExit):
			sys.exit()

	#rospy.spin()

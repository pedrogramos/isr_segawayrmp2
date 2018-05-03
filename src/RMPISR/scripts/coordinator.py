#!/usr/bin/env python
import rospy
import sys
import numpy as np
import math
from RMPISR.srv import *
from geometry_msgs.msg import Point, Pose2D
from std_msgs.msg import Bool
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
from random import randint
import pygame
import threading
import tf
import copy
#from vstptest import robotTrajectory
import csv


#to compile for ros
#chmod +x scripts/coordinator.py

#to launch the arduino rospy
#ls -l /dev/ttyACM*
#sudo chmod a+rw /dev/ttyACM0
#rosrun rosserial_python serial_node.py /dev/ttyACM0


#no ISR
sys.path.insert(0,'/home/rmp/lib/python')
MAP='/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile2.xml'
import vstpPY

traj1='/home/rmp/catkin_ws/src/RMPISR/scripts/DemonstrationPoints2.csv'


'''
STATE TABLE:
0-Stop
1-Go
2-Add Point
'''

class coordinator():

	def __init__(self,robotRadius=0.74,gridResolution=0.2,idealDist=0.8,maxDist=1):
		self.robotRadius=robotRadius
		self.gridResolution=gridResolution
		self.idealDist=idealDist
		self.maxDist=maxDist
		#self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		self.danger_sub = rospy.Subscriber('/sonarFlag', Bool, self.callbackSonar)
		#para o segway
		#self.odom_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom)
		self.odom_sub = rospy.Subscriber('/odomUpdater', Pose2D, self.callbackOdom)
		self.pose=Pose2D()
		self.trueodomX=0
		self.trueodomY=0
		self.trueodomTheta=0
		self.danger= Bool()
		self.state=0
		self.son=bool()
		self.traj_points=[]
		self.rectorig = pygame.rect.Rect(10,10,10,10)


	#Callback function implementing the pose value received
	def callbackOdom(self, data):
		self.trueodomX=data.x
		self.trueodomY=data.y
		self.trueodomTheta=data.theta

#---------------------------------------------------------------------------------------------------------------------------#
		
	def callbackSonar(self,data):
		self.danger=data.data;
		#if(self.danger==True and self.state != 0):
		if(self.danger==True ):
			self.stop_client()
			print "Parei devido a um obstaculo!"
			self.son=True;
		#if(self.danger==False and self.state != 1):
		#	self.go_client()
			#print "devia chamar go"
		'''
		if (self.danger==False and self.son ==True):
			self.go_client()
			self.son=False
		print "sonarFlag: %s " % (self.danger)
		print "State %d" % (self.state)
		'''

#---------------------------------------------------------------------------------------------------------------------------#

	def stop_client(self):
		rospy.wait_for_service('stop')
		try:
			stop_ = rospy.ServiceProxy('stop', stop)
			resp1 = stop_.call()
			self.state=resp1.state
			print "Stop Service called. State: %d" % self.state

		except rospy.ServiceException, e:
			print "Stop Service call failed: %s" % e


	def go_client(self):
		rospy.wait_for_service('go')
		try:
			go_ = rospy.ServiceProxy('go', go)
			resp1 = go_.call()
			self.state=resp1.state
			print "Go Service called. State: %d" % self.state

		except rospy.ServiceException, e:
			print "Service call failed: %s" % e

#---------------------------------------------------------------------------------------------------------------------------#



	def addpoint_client(self):
		rospy.wait_for_service('addpoint')
		try:
			addpoint_ = rospy.ServiceProxy('addpoint', addpoint)

			#code for file reading
			pointArray=list()
			size=len(self.myList)

			for elem in range(size):
				toappend = Point()
				toappend.x = float(self.myList[elem]['x'])
				toappend.y = float(self.myList[elem]['y'])
				pointArray.append(toappend)

			print pointArray

			'''

			#code for vstp trajectory points
			size=len(self.traj_points)

			for i in range(size):
				toappend = Point()
				toappend.x=self.traj_points[i].x
				toappend.y=self.traj_points[i].y
				pointArray.append(toappend)
			
			#print "new point: " , pointArray
			'''
			
			'''
			#code for random numbers
			
			for elem in range(10):
				toappend = Point()
				toappend.x=randint(0, 9)
				toappend.y=randint(0, 9)
				toappend.z=randint(0, 9)
				pointArray.append(toappend)
				print "new point:" , pointArray


			#print pointArray
			size=len(pointArray) #9
			'''


			

			resp1 = addpoint_.call(pointArray, True, size)

			print "servico addpoint"
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e

#---------------------------------------------------------------------------------------------------------------------------#

	def readFile(self,filename):
		self.myList = []
		with open (filename,'r') as rf:
			csv_DictReader = csv.DictReader(rf) 
			for row in csv_DictReader:
				self.myList.append(row)

#---------------------------------------------------------------------------------------------------------------------------#


	def computeMapLimits(self):
		minx=10000
		maxx=-10000
		miny=100000
		maxy=-100000
		
		for i in range(len(self.mapsegs)):
			#min X
			if (self.mapsegs[i].x0 or self.mapsegs[i].x1) < minx:
				if (self.mapsegs[i].x0 < self.mapsegs[i].x1): #1st lower
					minx=self.mapsegs[i].x0 
				else: minx=self.mapsegs[i].x1 #equal to 2nd
			#MAX X
			if (self.mapsegs[i].x0 or self.mapsegs[i].x1) > maxx:
				if (self.mapsegs[i].x0 > self.mapsegs[i].x1): #1st higher
					maxx=self.mapsegs[i].x0 
				else: maxx=self.mapsegs[i].x1 #equal to 2nd
			#min Y
			if (self.mapsegs[i].y0 or self.mapsegs[i].y1) < miny:
				if self.mapsegs[i].y0 < self.mapsegs[i].y1: #1st higher
					miny=self.mapsegs[i].y0 
				else: miny=self.mapsegs[i].y1 #equal to 2nd
			#MAX Y
			if (self.mapsegs[i].y0 or self.mapsegs[i].y1) > maxy:
				if (self.mapsegs[i].y0 > self.mapsegs[i].y1): #1st higher
					maxy=self.mapsegs[i].y0 
				else: maxy=self.mapsegs[i].y1 #equal to 2nd

		self.mapminx=minx
		self.mapminy=miny
		self.mapmaxx=maxx
		self.mapmaxy=maxy
		print "minX: %f, minY: %f, MAXX: %f, MAXY: %f" % (self.mapminx,self.mapminy,self.mapmaxx,self.mapmaxy)

#---------------------------------------------------------------------------------------------------------------------------#

		
	def criaMapa(self,displayx=800,displayy=480):
		
		raciox=(displayx-5)/(self.mapmaxx-self.mapminx)
		racioy=(displayy-5)/(self.mapmaxy-self.mapminy)

		#gamepy inicialization window
		screen = pygame.display.set_mode((displayx, displayy))

		pygame.display.set_caption("Representacao da posicao do modulo RMP")

		rate = rospy.Rate(5)
		while not rospy.is_shutdown():
		
			try:
				screen.fill((0,0,0))
				#map segments representation
				for i in range(len(self.mapsegs)):
					pygame.draw.line(screen, (255, 255, 255), ((self.mapsegs[i].x0-self.mapminx)*raciox, (self.mapsegs[i].y0-self.mapminy)*racioy),  ((self.mapsegs[i].x1-self.mapminx)*raciox, (self.mapsegs[i].y1-self.mapminy)*racioy))


				#trajectory representation
				for i in range(1,len(self.traj_points)):
					pygame.draw.line(screen, (0, 255,255), ((self.traj_points[i-1].x-self.mapminx)*raciox, (self.traj_points[i-1].y-self.mapminy)*racioy),  ((self.traj_points[i].x-self.mapminx)*raciox, (self.traj_points[i].y-self.mapminy)*racioy))

				
				#odometry representation
				pygame.draw.circle(screen, (255, 0, 0), [int((self.trueodomX-self.mapminx)*raciox), int((self.trueodomY-self.mapminy)*racioy)], int(self.robotRadius*raciox))
				

				screen2 = pygame.transform.flip(screen,0,1)
				pygame.display.flip()
				rate.sleep()


			except (KeyboardInterrupt, SystemExit, rospy.is_shutdown()):
				cleanup_stop_thread()
				pygame.quit()
				sys.exit()

#---------------------------------------------------------------------------------------------------------------------------#
		
			
	#thread para a const actualizacao da posicao do robot no display
	def toThread(self):
		mapThread = threading.Thread(target=self.criaMapa)
		mapThread.daemon=True
		mapThread.start()
		#mapThread.join()

#---------------------------------------------------------------------------------------------------------------------------#


	#divisao do segmentos provenientes do VSTP em segmentos mais pequenos
	#scale -> tamanho maximo dos segmentos desejados
	def trajDivider(self,scale=1):
		size=len(self.traj_points)
		print size
		self.new_traj = list()
		aux_traj=Point()

		for i in range(1,size):
			#print "i=", i
			#saber em que eixo o segmento aumenta (sentido de navegacao)
			if (self.traj_points[i-1].x != self.traj_points[i].x):
				alongX=True
			else: alongX=False

			#calculo da distancia euclidiana entre pontos
			d=math.sqrt(math.pow((self.traj_points[i].x-self.traj_points[i-1].x),2)+math.pow((self.traj_points[i].y-self.traj_points[i-1].y),2))
			#calculo de quantas vezes cabe a meu espacamento entre pontos na distancia total por excesso
			bitola=int(math.ceil(d/scale))
			#print bitola
			#fazer os segmentos com a distancia entre eles toda igual
			new_scale=d/bitola

			#print "d= %f bitola= %f " % (d,bitola)

			# inicializacao da nova trajectoria
			aux_traj.x = self.traj_points[i-1].x
			aux_traj.y = self.traj_points[i-1].y
			for j in xrange(bitola):
				#print "2nd cycle", j
				if (alongX == True):
					aux_traj.x = aux_traj.x + new_scale
					aux_traj.y = aux_traj.y
					#print aux_traj
					self.new_traj.append(copy.deepcopy(aux_traj))

				
				else:
					aux_traj.x = aux_traj.x
					aux_traj.y = aux_traj.y + new_scale
					self.new_traj.append(copy.deepcopy(aux_traj))
					#print aux_traj

		print "lista final:" , self.new_traj

#---------------------------------------------------------------------------------------------------------------------------#

	#funcao que quando chamada retorna a trajetoria de pontos
	def vstpFunc(self,iniX,iniY,goalx,goaly):
		#coordenadas de partida (inicio)
		print "odomx: %f odomy: %f" % (iniX,iniY)
		#coordenadas de destino (fim)
		print "goalx: %f goaly: %f" % (goaly,goaly)

		v=vstpPY.VSTP() #criacao do objeto
		v.init(self.robotRadius,self.gridResolution,self.idealDist,self.maxDist)
		self.mapsegs = v.loadMap(MAP)
		self.computeMapLimits();
		self.traj_points =v.planTrajectory(iniX,iniY,goalx,goaly,True)
		#chamada a criacao do thread do mapa
		#self.toThread()
		self.trajDivider()
		#chamada servico para adicionar os pontos ao modulo de navegacao
		#self.addpoint_client()
		
		

#---------------------------------------------------------------------------------------------------------------------------#


if __name__ == "__main__":
	rospy.init_node("coordinator_node",anonymous=True)
	print "entrou"
	boss=coordinator()
	boss.readFile(traj1)
	#boss.vstpFunc(1,1,55,3)
	boss.addpoint_client()

	rospy.spin()





	'''
	#boss.vstpFunc(0,0,55,0)

	#boss.vstpFunc(1,1,55,3)
	#boss.vstpFunc(55,3,55,10)
	#boss.addpoint_client()
	#boss.vstpFunc(2,2,0,0)

	#rospy.sleep(2.)	
	#boss.go_client()
	'''
#!/usr/bin/env python
import rospy
import sys
import numpy
from RMPISR.srv import *
from geometry_msgs.msg import Point
from std_msgs.msg import Bool
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
from random import randint
import pygame
import threading


#to launch the arduino rospy
#rosrun rosserial_python serial_node.py /dev/ttyACM1

#no meu pc
#sys.path.insert(0,'/home/pedrogramos/Desktop/Thesis/vstpPy/build/python')


#no ISR
sys.path.insert(0,'/home/rmp/lib/python')
#sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/build/python')
#sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/scr')
import vstpPY


'''
state table:
0-Stop
1-Go
2-Add Point
'''

class coordinator():

	def __init__(self,robotRadius=0.74,gridResolution=0.6,idealDist=0.1,maxDist=0.1):
		#self.velocity_publisher = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
		self.pose = Pose()
		self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		self.danger_sub = rospy.Subscriber('/sonarFlag', Bool, self.callbackSonar)
		self.rate = rospy.Rate(10)
		self.robotRadius=robotRadius
		self.gridResolution=gridResolution
		self.idealDist=idealDist
		self.maxDist=maxDist
		self.segs_mapa=list()
		self.traj_points=list()
		self.odomX=0
		self.odomY=0
		self.danger= Bool()
		self.state=0

	#Callback function implementing the pose value received
	def callbackOdom(self, data):
		self.odomY=data.y
		self.odomX=data.x
		#print"ODOM x:%f y:%f"% (self.odomX,self.odomY)

	def callbackSonar(self,data):
		self.danger=data.data;
		if(self.danger==True and self.state != 0):
			self.stop_client()
			print "devia chamar stop"
		if(self.danger==False and self.state != 1):
			self.go_client()
			print "devia chamar stop"
		print "sonarFlag: %s " % (self.danger)

	def stop_client(self):
		rospy.wait_for_service('stop')
		try:
			stop_ = rospy.ServiceProxy('stop', stop)
			resp1 = stop_.call()
			self.state=resp1.state
			print "servico stop %d" % self.state

		except rospy.ServiceException, e:
			print "Service call failed: %s" % e


	def go_client(self):
		rospy.wait_for_service('go')
		try:
			go_ = rospy.ServiceProxy('go', go)
			resp1 = go_.call()
			self.state=resp1.state
			print "servico go %d" % self.state

		except rospy.ServiceException, e:
			print "Service call failed: %s" % e

	def addpoint_client(self):
		rospy.wait_for_service('addpoint')
		try:
			addpoint_ = rospy.ServiceProxy('addpoint', addpoint)

			pointArray=list()
			
			#code for random numbers
			'''
			for elem in range(10):
				toappend = Point()
				toappend.x=randint(0, 9)
				toappend.y=randint(0, 9)
				toappend.z=randint(0, 9)
				pointArray.append(toappend)
				print "new point:" , pointArray


			#print pointArray
			size=len(pointArray)9
			'''
			#code for vstp trajectory points
			size=len(self.traj_points)

			for i in range(size):
				toappend = Point()
				toappend.x=self.traj_points[i].x
				toappend.y=self.traj_points[i].y
				pointArray.append(toappend)
			
			print "new point:" , pointArray

			resp1 = addpoint_.call(pointArray, True, size)

			print "servico addpoint"
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e
			
	def criaMapa(self,displayx=640,displayy=400):
		minx=0
		maxx=0
		miny=0
		maxy=0
		for i in range(len(self.segs_mapa)):
			#min X
			if (self.segs_mapa[i].x0 or self.segs_mapa[i].x1) < minx:
				if (self.segs_mapa[i].x0 < self.segs_mapa[i].x1): #1st lower
					minx=self.segs_mapa[i].x0 
				else: minx=self.segs_mapa[i].x1 #equal to 2nd
			#MAX X
			if (self.segs_mapa[i].x0 or self.segs_mapa[i].x1) > maxx:
				if (self.segs_mapa[i].x0 > self.segs_mapa[i].x1): #1st higher
					maxx=self.segs_mapa[i].x0 
				else: maxx=self.segs_mapa[i].x1 #equal to 2nd
			#min Y
			if (self.segs_mapa[i].y0 or self.segs_mapa[i].y1) < miny:
				if self.segs_mapa[i].y0 < self.segs_mapa[i].y1: #1st higher
					miny=self.segs_mapa[i].y0 
				else: miny=self.segs_mapa[i].y1 #equal to 2nd
			#MAX Y
			if (self.segs_mapa[i].y0 or self.segs_mapa[i].y1) > maxy:
				if (self.segs_mapa[i].y0 > self.segs_mapa[i].y1): #1st higher
					maxy=self.segs_mapa[i].y0 
				else: maxy=self.segs_mapa[i].y1 #equal to 2nd


		print "minX: %f, minY: %f, MAXX: %f, MAXY: %f" % (minx,miny,maxx,maxy)
		maxy=25.1
		maxx=61.8
		minx=-5.8
		miny=0
		raciox=((displayx-5)/maxx)
		racioy=((displayy-5)/maxy)
		raciopixx=maxx/displayx
		raciopixy=maxy/displayy
		#print minx
		print "minX: %f, minY: %f, MAXX: %f, MAXY: %f" % (minx,miny,maxx,maxy)
		#print "x %f Y %f" % (raciox,racioy)
		
		#gamepy inicialization window
		screen = pygame.display.set_mode((displayx, displayy))
		pygame.display.set_caption("Representacao da posicao do modulo RMP")

		rate = rospy.Rate(5)
		#while not rospy.is_shutdown():
		#try:
		#representation of the map segments on the window
		for i in range(len(self.segs_mapa)):
			pygame.draw.line(screen, (255, 255, 255), (self.segs_mapa[i].x0*raciox, self.segs_mapa[i].y0*racioy),  (self.segs_mapa[i].x1*raciox, self.segs_mapa[i].y1*racioy))
			#pygame.draw.line(screen, (255, 255, 255), (segs_mapa[i].x0/raciopixx, segs_mapa[i].y0/raciopixy),  (segs_mapa[i].x1/raciopixx, segs_mapa[i].y1/raciopixy))
			pygame.display.flip()

		#trajectory representation
		for i in range(1,len(self.traj_points)):
			'''
			print "inicio"
			print (i,self.traj_points[i-1].x,self.traj_points[i-1].y)
			print "fim"
			print (i,self.traj_points[i].x,self.traj_points[i].y)
			'''
			pygame.draw.line(screen, (0, 255,255), (self.traj_points[i-1].x*raciox, self.traj_points[i-1].y*racioy),  (self.traj_points[i].x*raciox, self.traj_points[i].y*racioy))
			pygame.display.flip()

		screen2=screen
    
		while True:
			#screen.fill((0,0,0))


			#odometry representation
			#pygame.draw.circle(screen, (255, 0, 0), [int(odomX/raciopixx), int(odomY/raciopixy)], int(0.74/raciopixx))
		
		
			pygame.draw.circle(screen2, (255, 0, 0), [int(self.odomX/raciopixx), int(self.odomY/raciopixy)], int(self.robotRadius/raciopixx))
			pygame.display.flip()
			#print"circle px: %d py: %d", (int(self.odomX/raciopixx),int(self.odomY/raciopixy))
			rate.sleep()
		'''
		except (KeyboardInterrupt, SystemExit):
    			cleanup_stop_thread()
    			sys.exit()
    	'''
	def toThread(self):
		mapThread = threading.Thread(target=self.criaMapa)
		mapThread.setDaemon(True)
		mapThread.start()
		#mapThread.join()


	def vstpFunc(self,iniX,iniY,goalx,goaly):
		print "odomx: %f odomy: %f" % (iniX,iniY)
		print "goalx: %f goaly: %f" % (goaly,goaly)

		v=vstpPY.VSTP()
		v.init(self.robotRadius,self.gridResolution,self.idealDist,self.maxDist)
		self.segs_mapa = v.loadMap("/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile2.xml")
		self.traj_points =v.planTrajectory(iniX,iniY,goalx,goaly,False)
		
		self.toThread()

if __name__ == "__main__":
	rospy.init_node("coordinator_node",anonymous=True)
	print "entrou"
	boss=coordinator()

	boss.vstpFunc(1,1,55,3)

	boss.stop_client()
	rospy.sleep(2.)
	boss.addpoint_client()	
	rospy.sleep(2.)	
	boss.go_client()

	rospy.spin()
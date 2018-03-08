#!/usr/bin/env python
import rospy
from geometry_msgs.msg  import Twist
from turtlesim.msg import Pose
from math import pow,atan2,sqrt

import rospy
import sys
import numpy
from RMPISR.srv import *
from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry
from random import randint
import pygame



#no meu pc
#sys.path.insert(0,'/home/pedrogramos/Desktop/Thesis/vstpPy/build/python')


#no ISR
sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/build/python')
#sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/scr')
import vstpPY

class map():

	def __init__(self):
		#Creating our node,publisher and subscriber
		rospy.init_node("coordinator_node",anonymous=True)
		self.velocity_publisher = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
		self.pose_subscriber = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		self.pose = Pose()
		self.rate = rospy.Rate(10)

	#Callback function implementing the pose value received
	def callbackOdom(self, data):
		self.pose = data
		self.pose.x = round(self.pose.x, 4)
		self.pose.y = round(self.pose.y, 4)


	def stop_client(self):
		rospy.wait_for_service('stop')
		try:
			stop_ = rospy.ServiceProxy('stop', stop)
			resp1 = stop_.call()
			print "servico stop"
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e


	def go_client(self):
		rospy.wait_for_service('go')
		try:
			go_ = rospy.ServiceProxy('go', go)
			resp1 = go_.call()
			print "servico go"
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e

	def addpoint_client(self):
		rospy.wait_for_service('addpoint')
		try:
			addpoint_ = rospy.ServiceProxy('addpoint', addpoint)

			pointArray=list()
			

			for elem in range(10):
				toappend = Point()
				toappend.x=randint(0, 9)
				toappend.y=randint(0, 9)
				toappend.z=randint(0, 9)
				pointArray.append(toappend)
				print "new point:" , pointArray


			#print pointArray
			size=9

			resp1 = addpoint_.call(pointArray, True, size)
			print "servico addpoint"
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e

	def criaMapa(self,segs_mapa,displayx=640,displayy=400):
		minx=0
		maxx=0
		miny=0
		maxy=0
		for i in range(len(segs_mapa)):
			#min X
			if (segs_mapa[i].x0 or segs_mapa[i].x1) < minx:
				if (segs_mapa[i].x0 < segs_mapa[i].x1): #1st lower
					minx=segs_mapa[i].x0 
				else: minx=segs_mapa[i].x1 #equal to 2nd
			#MAX X
			if (segs_mapa[i].x0 or segs_mapa[i].x1) > maxx:
				if (segs_mapa[i].x0 > segs_mapa[i].x1): #1st higher
					maxx=segs_mapa[i].x0 
				else: maxx=segs_mapa[i].x1 #equal to 2nd
			#min Y
			if (segs_mapa[i].y0 or segs_mapa[i].y1) < miny:
				if segs_mapa[i].y0 < segs_mapa[i].y1: #1st higher
					miny=segs_mapa[i].y0 
				else: miny=segs_mapa[i].y1 #equal to 2nd
			#MAX Y
			if (segs_mapa[i].y0 or segs_mapa[i].y1) > maxy:
				if (segs_mapa[i].y0 > segs_mapa[i].y1): #1st higher
					maxy=segs_mapa[i].y0 
				else: maxy=segs_mapa[i].y1 #equal to 2nd


		raciox=(displayx/maxx)-0.2
		racioy=(displayy/maxy)-0.2
		raciopixx=maxx/displayx
		raciopixy=maxy/displayy
		#print minx
		#print "minX: %f, minY: %f, MAXX: %f, MAXY: %f" % (minx,miny,maxx,maxy)
		#print "x %f Y %f" % (raciox,racioy)
		
		
		screen = pygame.display.set_mode((displayx, displayy))
		pygame.display.set_caption("Representacao da posicao do modulo RMP")
		for i in range(len(segs_mapa)):
			#pygame.draw.line(screen, (255, 255, 255), ((segs_mapa[i].x0*displayx)/maxx, (segs_mapa[i].y0*displayy)/maxy),  ((segs_mapa[i].x1*displayx)/maxx, (segs_mapa[i].y1*displayy)/maxy))
			#pygame.draw.line(screen, (255, 255, 255), (((segs_mapa[i].x0)*(displayx/maxx)), ((segs_mapa[i].y0)*(displayy/maxy))),  (((segs_mapa[i].x1)*(displayx/maxx)), ((segs_mapa[i].y1)*(displayy/maxy))))
			#pygame.draw.line(screen, (255, 255, 255), (segs_mapa[i].x0*10, segs_mapa[i].y0*15),  (segs_mapa[i].x1*10, segs_mapa[i].y1*15))
			pygame.draw.line(screen, (255, 255, 255), (segs_mapa[i].x0*raciox, segs_mapa[i].y0*racioy),  (segs_mapa[i].x1*raciox, segs_mapa[i].y1*racioy))
			
			pygame.display.flip()

		#rect = pygame.Rect(start_x, start_y, width, height)
		#circle(Surface, color, pos, radius, width=0)
		#pygame.draw.circle(screen, (255, 0, 0), [int(20*raciopixx), int(0.5*raciopixy)], int(0.74*raciopixx))
		pygame.display.flip()
		#pygame.draw.circle(screen, BLUE, [0, 0] ,0.7)

	# to pass to a class https://www.programiz.com/article/python-self-why
	def vstpFunc(self,odomx,odomy,goalx,goaly,robotRadius=0.74,gridResolution=0.6,idealDist=0.1,maxDist=0.1):
		v=vstpPY.VSTP()
		print "odomx: %f odomy: %f" % (odomx,odomy)
		print "goalx: %f goaly: %f" % (goaly,goaly)

		#v.init(0.74,0.6,0.2,0.1)
		v.init(robotRadius,gridResolution,idealDist,maxDist)
		#no meu pc
		#segs_mapa = v.loadMap("/home/pedrogramos/catkin_ws/src/RMPISR/scripts/ISRfile2.xml")
		segs_mapa = v.loadMap("/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile2.xml")
		traj_points =v.planTrajectory(odomx,odomy,goalx,goaly,False)
		
		criaMapa(segs_mapa)


if __name__ == "__main__":
	rospy.init_node("boss_node",anonymous=True)
	print "entrou"
	
	stop_client()
	rospy.sleep(2.)
	addpoint_client()	
	rospy.sleep(2.)	
	go_client()
	
	#vstpFunc(0,0,2,2)

	rospy.spin()

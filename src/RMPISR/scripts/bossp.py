#!/usr/bin/env python

'''
		# simplified style
		resp1 = add_two_ints(x, y)

		# formal style
		resp2 = add_two_ints.call(AddTwoIntsRequest(x, y))
'''
#import numpy
#import serial
import rospy
import sys
import numpy
from RMPISR.srv import *
from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
from random import randint
import pygame



#no meu pc
#sys.path.insert(0,'/home/pedrogramos/Desktop/Thesis/vstpPy/build/python')


#no ISR
sys.path.insert(0,'/home/rmp/lib/python')
#sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/scr')
import vstpPY

odomX=0
odomY=0

def callbackOdom(data):
	data2=Pose()
	data2=data
	global odomX, odomY
	odomY=data2.y
	odomX=data2.x
	#print"ODOM x:%f y:%f"% (odomX,odomY)

def criaMapa(segs_mapa,traj_points,displayx=640,displayy=400):
	minx=0
	maxx=0
	miny=0
	maxy=0
	displayx=displayx;
	displayy=displayy;
	
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

	#aspect ratio calculation
	raciox=((displayx-5)/maxx)
	racioy=((displayy-5)/maxy)
	raciopixx=maxx/displayx
	raciopixy=maxy/displayy
	#print minx
	#print "minX: %f, minY: %f, MAXX: %f, MAXY: %f" % (minx,miny,maxx,maxy)
	#print "x %f Y %f" % (raciox,racioy)
	
	#gamepy inicialization window
	screen = pygame.display.set_mode((displayx, displayy))
	pygame.display.set_caption("Representacao da posicao do modulo RMP")

	#representation of the map segments on the window
	for i in range(len(segs_mapa)):
		pygame.draw.line(screen, (255, 255, 255), (segs_mapa[i].x0*raciox, segs_mapa[i].y0*racioy),  (segs_mapa[i].x1*raciox, segs_mapa[i].y1*racioy))
		#pygame.draw.line(screen, (255, 255, 255), (segs_mapa[i].x0/raciopixx, segs_mapa[i].y0/raciopixy),  (segs_mapa[i].x1/raciopixx, segs_mapa[i].y1/raciopixy))
		pygame.display.flip()

	#trajectory representation
	for i in range(1,len(traj_points)):
		print "inicio"
		print (i,traj_points[i-1].x,traj_points[i-1].y)
		print "fim"
		print (i,traj_points[i].x,traj_points[i].y)

		pygame.draw.line(screen, (0, 255,255), (traj_points[i-1].x*raciox, traj_points[i-1].y*racioy),  (traj_points[i].x*raciox, traj_points[i].y*racioy))
		pygame.display.flip()

	#odometry representation
	#pygame.draw.circle(screen, (255, 0, 0), [int(odomX/raciopixx), int(odomY/raciopixy)], int(0.74/raciopixx))
	rate = rospy.Rate(10)
	while not rospy.is_shutdown():
		pygame.draw.circle(screen, (255, 0, 0), [int(odomX/raciopixx), int(odomY/raciopixy)], int(0.74/raciopixx))
		pygame.display.flip()
		#print"circle px: %d py: %d", (int(odomX/raciopixx),int(odomY/raciopixy))
		#rospy.spin()
		rate.sleep()
	

# to pass to a class https://www.programiz.com/article/python-self-why
def vstpFunc(odomx,odomy,goalx,goaly,robotRadius=0.75,gridResolution=0.1,idealDist=0.4,maxDist=1):
	v=vstpPY.VSTP()
	print "odomx: %f odomy: %f" % (odomx,odomy)
	print "goalx: %f goaly: %f" % (goaly,goaly)

	#v.init(0.74,0.6,0.2,0.1)
	v.init(robotRadius,gridResolution,idealDist,maxDist)
	#no meu pc
	#segs_mapa = v.loadMap("/home/pedrogramos/catkin_ws/src/RMPISR/scripts/ISRfile2.xml")
	segs_mapa = v.loadMap("/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile3.xml")
	traj_points =v.planTrajectory(odomx,odomy,goalx,goaly,True)
	
	criaMapa(segs_mapa,traj_points)

	return segs_mapa, traj_points
	

def stop_client():
	rospy.wait_for_service('stop')
	try:
		stop_ = rospy.ServiceProxy('stop', stop)
		resp1 = stop_.call()
		print "servico stop"
	except rospy.ServiceException, e:
		print "Service call failed: %s"%e


def go_client():
	rospy.wait_for_service('go')
	try:
		go_ = rospy.ServiceProxy('go', go)
		resp1 = go_.call()
		print "servico go"
	except rospy.ServiceException, e:
		print "Service call failed: %s"%e

def addpoint_client():
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




if __name__ == "__main__":
	rospy.init_node("boss_node",anonymous=True)
	print "entrou"
	'''
	stop_client()
	rospy.sleep(2.)
	addpoint_client()	
	rospy.sleep(2.)	
	go_client()
	'''
	try:
		rospy.Subscriber('/turtle1/pose', Pose, callbackOdom)
		segs_mapa, traj_points=vstpFunc(502,10,370,210,7.5,3,7,10)
	except rospy.ROSInterruptException:
		pass

	#vstpFunc(0,0,56,5)
	'''
	while not rospy.is_shutdown():
		criaMapa(segs_mapa, traj_points)
		rospy.spin()
	'''

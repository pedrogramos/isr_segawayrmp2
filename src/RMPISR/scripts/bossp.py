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
from RMPISR.srv import *
from geometry_msgs.msg import Point
from random import randint


sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/build/python')
sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/scr')
#sys.path.append(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy')
import vstpPY

def testeVSTP(odomx,odomy,goalx,goaly,robotRadius=0.74,gridResolution=0.6,idealDist=0.1,maxDist=0.1):
	v=vstpPY.VSTP()
	print "odomx: %f odomy: %f" % (odomx,odomy)
	print "goalx: %f goaly: %f" % (goaly,goaly)

	#v.init(0.74,0.6,0.2,0.1)
	v.init(robotRadius,gridResolution,idealDist,maxDist)
	segs_mapa = v.loadMap("/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile2.xml")
	traj_points =v.planTrajectory(odomx,odomy,goalx,goaly,False) 


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
	testeVSTP(0,0,2,2)

	rospy.spin()

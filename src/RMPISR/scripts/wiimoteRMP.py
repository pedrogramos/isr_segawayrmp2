#!/usr/bin/python
################################################################################
#
# File:         wiimode_node.py
# Description:	Reads wiimote data to control the state of a RMP robot.
#				Project for a MSc thesis.
# Author:       Pedro Guilherme Ramos
# Created:      Thu Mar 20 10:40:00 2018
# Language:     Python
# Status:       Experimental
#
################################################################################


import rospy
from RMPISR.srv import *
from std_msgs.msg import Bool
from wiimote.msg import State
from geometry_msgs.msg import Twist


#wiimoteDevice.setLEDs([False, False, False, False])

class wii:

	def __init__(self):
		self.buttonState = [False,False,False,False,False,False,False,False,False,False]
		#testar com self.buttonState = State()
		self.odom_sub = rospy.Subscriber('/wiimote/state', State, self.callbackState)
		self.vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)
		#print self.buttonState

	def callbackState(self,data):
		self.buttonState = data.buttons
		#print "Button: %s " % self.buttonState

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

	def control(self):
		boost=1.0
		vel = Twist()
		andar = False

		'''
		  static const int MSG_BTN_1     = 0;
		  static const int MSG_BTN_2     = 1;
		  static const int MSG_BTN_PLUS  = 2;
		  static const int MSG_BTN_MINUS = 3;
		  static const int MSG_BTN_A     = 4;
		  static const int MSG_BTN_B     = 5;
		  static const int MSG_BTN_UP    = 6;
		  static const int MSG_BTN_DOWN  = 7;
		  static const int MSG_BTN_LEFT  = 8;
		  static const int MSG_BTN_RIGHT = 9;
		  static const int MSG_BTN_HOME  = 10;
		'''

		#plus button
		if (self.buttonState[2]):
			rospy.sleep(1)
			self.go_client()

		#minus button
		if(self.buttonState[3]):
			rospy.sleep(1)
			self.stop_client()

		#B back button
		if(self.buttonState[5]):
			boost = 1.5

		#up button
		if(self.buttonState[6]):
			vel.linear.x = 0.3*boost
			andar=True

		#down button
		if(self.buttonState[7]):
			vel.linear.x = -0.3*boost
			andar=True

		#left button
		if(self.buttonState[8]):
			vel.angular.z = 2.35619449019*boost
			andar=True

		#right button
		if(self.buttonState[9]):
			vel.angular.z = -2.35619449019*boost
			andar=True

		if (andar == True):
			self.vel_pub.publish(vel)





if __name__ == "__main__":
	rospy.init_node("wiimoteRMP_node",anonymous=True)
	wiinh=wii()
	#wiinh.control()
	
	while not rospy.is_shutdown():
		wiinh.control()
	
	rospy.spin()
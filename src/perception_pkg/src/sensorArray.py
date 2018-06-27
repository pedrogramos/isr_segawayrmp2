#!/usr/bin/env python
import serial
import copy
import rospy
from RMPISR.msg import *


values = []
array = sensors()


def talker():
	pub = rospy.Publisher('sensorArray', sensors, queue_size=10)
	ser = serial.Serial('/dev/ttyACM1', 115200)
	rospy.init_node('sensorData', anonymous=True)
	rate = rospy.Rate(10) # 10hz

	if (ser.is_open):
		print "Connection established. Receiving values.."

	while not rospy.is_shutdown():
		s = ser.readline()
		#sf = s.decode('utf-8')
		print s

		if (s == "hshake\r\n") and (len(values) == 7):

			'''
			array.ir1 = float(values[0])
			array.s1 = float(values[1])
			array.ir2 = float(values[2])
			array.s2 = float(values[3])
			array.ir3 = float(values[4])
			array.ir4 = float(values[5])
			array.s5 = float(values[6])
			'''
			array.ir1 = values[0]
			array.s1 = values[1]
			array.ir2 = values[2]
			array.s2 = values[3]
			array.ir3 = values[4]
			array.ir4 = values[5]
			array.s5 = values[6]

			pub.publish(array)

			print values
			print "ir2: ", array.ir2
			print "s2: ", array.s2
			print "ir3: ", array.ir3
			del values[:]

		else:
			print len(values)
			values.append(copy.deepcopy(s.strip("/r/n")))

		rate.sleep()

if __name__ == '__main__':

	print "Trying to connect to arduino..."

	try:
		talker()
	except rospy.ROSInterruptException:
		pass
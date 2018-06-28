#!/usr/bin/env python
import serial
import copy
import rospy
from RMPISR.msg import sensors

#to launch the arduino rospy
#ls -l /dev/ttyACM*
#sudo chmod a+rw /dev/ttyACM0
#rosrun rosserial_python serial_node.py /dev/ttyACM0
#rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0 _baud:=115200




'''
Para detectar a porta automaticamente:
	https://stackoverflow.com/questions/24214643/python-to-automatically-select-serial-ports-for-arduino

'''
values = []
array = sensors()
once = True


def talker():
	pub = rospy.Publisher('sensorArray', sensors, queue_size=10)
	ser = serial.Serial('/dev/ttyACM0', 115200)
	rospy.init_node('sensorData', anonymous=True)
	rate = rospy.Rate(10) # 10hz

	if (ser.is_open):
		print "Connection established."

		while not rospy.is_shutdown():
			s = ser.readline()
			#sf = s.decode('utf-8')
			#print s

			if (s == "hshake\r\n"):

				if(len(values) == 7):


					array.ir1 = float(values[0])
					array.s1 = float(values[1])
					array.ir2 = float(values[2])
					array.s2 = float(values[3])
					array.ir3 = float(values[4])
					array.ir4 = float(values[5])
					array.s5 = float(values[6])

					pub.publish(array)

					if(once):
						print "Publishing Values..."
						#once = False

					'''
					print values
					print "ir2: ", array.ir2
					print "s2: ", array.s2
					print "ir3: ", array.ir3
					'''
					del values[:]

				elif (len(values) > 7):
					del values[:]

			else:
				
				aux= s.strip("u\r\n'")
				#print "strip: ", aux
				aux2 = aux.replace('"', '')
				#print "replace: ", aux2
				
				values.append(copy.deepcopy(aux2))

			rate.sleep()

if __name__ == '__main__':

	print "Trying to connect to arduino..."

	try:
		talker()
	except rospy.ROSInterruptException:
		pass
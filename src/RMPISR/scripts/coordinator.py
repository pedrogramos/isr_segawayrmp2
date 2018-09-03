#!/usr/bin/env python

import rospy
import sys
import numpy as np
import math
from RMPISR.srv import *
from perception_pkg.srv import *
from geometry_msgs.msg import Point, Pose2D
from std_msgs.msg import Bool
from nav_msgs.msg import Odometry
from turtlesim.msg import Pose
from random import randint
import pygame
import threading
import tf
import copy
import tkFont
#from vstptest import robotTrajectory
import csv
#import Tkinter
from Tkinter import *
from PIL import ImageTk, Image


#to compile for ros
#chmod +x scripts/coordinator.py


'''
local_rot1= ["Main Hall","Lab: Mobile Robotics","Accounting","Lab: Computer Vision","Lab: Immersive Systems","Lab: Mechatronics","Accounting 2"]
positions_rot1 = [[3.6,2.3],[0.91,10.2],[7.78,6.71],[0.91,28.55],[0.91,25.8],[21.21,10.2],[13,6.71]]
rot1 = {'places':local_names, 'locations':positions}
local_rot1 = {'local':, 'pose':}
local_rot2 = {'local':, 'pose':}

dictionary = [local_rot1, local_rot2]

dictionary[0]['local']
a = dictionary[0]['pose']
a[0] a[1]

for elem in dictionary:
	start = elem[j]['pose']
	goal =   elem[j+1]['pose']
'''


rot1_1 = {'local':"Lab: Mobile Robotics", 'pose':[0.91,10.2]}
rot1_2 = {'local':"Lab: Immersive Systems", 'pose':[0.91,25.8]}
rot1_3 = {'local':"Lab: Computer Vision", 'pose':[0.91,28.55]}
tour1_dic = [rot1_1,rot1_2,rot1_3]



rot2_1 = {'local':"Lab: Computer Vision", 'pose':[0.91,28.55]} 
rot2_2 = {'local':"Lab: Mechatronics", 'pose':[21.21,10.2]}
rot2_3 = {'local':"Lab: Mobile Robotics", 'pose':[0.91,10.2]}
tour2_dic = [rot2_1,rot2_2,rot2_3]


arrived_to = str(tour1_dic[0]['local'])
tour1_bol = tour2_bol =  bool()
number = 0
number_tour = 1
size_tour = 3

places = {}

places ["Main Hall"] = [3.6,2.3]
places ["Lab: Mobile Robotics"] = [0.91,10.2]
places ["Accounting"] = [7.78,6.71]
places ["Lab: Computer Vision"] = [0.91,28.55]
places ["Lab: Immersive Systems"] = [0.91,25.8]
places ["Lab: Mechatronics"] = [21.21,10.2]
places ["Accounting 2"] = [13,6.71]

arrived_to2 = ''
serv_arrived = False


#no ISR
sys.path.insert(0,'/home/rmp/lib/python')
MAP2='/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile2.xml'
MAP='/home/rmp/catkin_ws/src/RMPISR/scripts/novo.xml'
import vstpPY
traj1='/home/rmp/catkin_ws/src/RMPISR/scripts/cen11.csv'
traj2='/home/rmp/catkin_ws/src/RMPISR/scripts/cen1.csv'

class App(Tk):
	def __init__(self):
		
		Tk.__init__(self)
		#Setup Menu
		MainMenu(self)
		#Setup Frame
		container = Frame(self)
		container.pack(side="top", fill="both", expand=True)
		container.grid_rowconfigure(0, weight=1)
		container.grid_columnconfigure(0, weight=1)

		self.frames = {}

		for F in (StartPage, PageOne, PageTwo, PageThree, PageFour, PageFive, PageSix, PageSeven):
			frame = F(container, self)
			self.frames[F] = frame
			frame.grid(row=0, column=0, sticky="nsew")

		
		self.show_frame(StartPage)	
	def show_frame(self, context):
		self.frame = self.frames[context]
		self.frame.tkraise()
		self.frame.update()
		self.frame.event_generate("<<ShowFrame>>")

	def handle_arrivedDestiny(self,req):
		self.frame.event_generate("<<chegou>>")
		
		return []

class StartPage(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)

		label = Label(self, text="Welcome to Instituto de Sistemas e Robotica!\n What do you want to do?", font=tkFont.Font(size=20))
		label.place(x=400, y=0)

		page_one = Button(self, text="Do a Visit", width=15, height=10, font=tkFont.Font(size=20), command=lambda:controller.show_frame(PageOne))
		page_one.place(x=200,y=300)
		#page_one = Button(self, text="Do a Visit", width=15, height=10, font=tkFont.Font(size=20), command=lambda:controller.show_frame(PageOne))
		#page_one.place(x=200,y=300)
		page_two = Button(self, text="Go to Place", width=15, height=10, font=tkFont.Font(size=20), command=lambda:controller.show_frame(PageTwo))
		page_two.place(x=800,y=300)
		
		'''
		self.img = ImageTk.PhotoImage(Image.open("/home/rmp/catkin_ws/src/RMPISR/scripts/ISRlogo.jpg"))
		panel = Label(self, image = self.img)
		#panel.img = img
		panel.pack()
		'''
		

class PageOne(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)

		def tour1():
			global number_tour
			number_tour = 1
			global size_tour
			size_tour = len(tour1_dic)
			global number
			number = 0
			p=coordinator()
			#substituir pela odom
			p.vstpFunc(0.5, 4, tour1_dic[0]['pose'][0], tour1_dic[0]['pose'][1])
			
			for i in xrange(1,len(tour1_dic)):
				print 
				print i
				p.vstpFunc(tour1_dic[i-1]['pose'][0], tour1_dic[i-1]['pose'][1], tour1_dic[i]['pose'][0], tour1_dic[i]['pose'][1])
				#p.addpoint_client(True)

			controller.show_frame(PageThree)
			

		def tour2():
			global number_tour
			number_tour = 2
			global size_tour
			size_tour = len(tour2_dic)
			global number
			number = 0
			p=coordinator()
			p.vstpFunc(0.5, 4, tour2_dic[0]['pose'][0], tour2_dic[0]['pose'][1])
			
			for i in xrange(1,len(tour2_dic)):
				p.vstpFunc(tour2_dic[i-1]['pose'][0], tour2_dic[i-1]['pose'][1], tour2_dic[i]['pose'][0], tour2_dic[i]['pose'][1])
				#p.addpoint_client(True)

			controller.show_frame(PageThree)

		labelframe1 = LabelFrame(self, text="Tour 1:", font=tkFont.Font(size=30))
		labelframe1.pack(fill="both", expand="yes")
		labelframe2 = LabelFrame(self, text="Tour 2:", font=tkFont.Font(size=30))
		labelframe2.pack(fill="both", expand="yes")

		#tour1_lbl = Label(self, text="Choose one of the following tours:", font=tkFont.Font(size=30))
		#tour1_lbl.place(x=400, y=0)
		tour1_lbl = Label(labelframe1, text="Lab Mobile Robotics\nLab Computer Vision\nLab Immersive Systems", font=tkFont.Font(size=30))
		#tour1_lbl.place(x=20, y=100)
		tour1_lbl.pack()
		tour2_lbl = Label(labelframe2, text="Lab: Computer Vision\nLab Mechatronics\nLab Mobile Robotics", font=tkFont.Font(size=30))
		#tour2_lbl.place(x=20, y=400)
		tour2_lbl.pack()


		tour1_start = Button(self, text="Start",width=15, height=5, command=tour1)
		tour1_start.place(x= 1100,y=250 )
		tour2_start = Button(self, text="Start",width=15, height=5, command=tour2)
		tour2_start.place(x= 1100, y=650)
		back = Button(self, text="Back",width=15, height=5, command=lambda:controller.show_frame(StartPage))
		back.place(x=20, y=650)
		'''
		img = Image.open("/home/rmp/catkin_ws/src/RMPISR/scripts/ISRlogo.jpg")
		img = img.resize((250,250), Image.ANTIALIAS)
		img2 = ImageTk.PhotoImage(img)
		panel = Label(self, image = img)
		#panel.img = img
		panel.pack(width=5, height=5)
		'''

class PageTwo(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)



		def choose(evt):
			w=evt.widget
			index=int(w.curselection()[0])
			value = w.get(index)
			self.result = places[value]
			#print value
			global arrived_to2
			arrived_to2 = value
			#print arrived_to2

		lb_places = Listbox(self, width=20, height=15, font=tkFont.Font(size=20))
		lb_places.place(x=500,y=40)
		lb_places.bind('<<ListboxSelect>>',choose)


		def show_all(self, lb_places, places):
			lb_places.delete(0,"end") # to clear the window when you press the button
			for destiny in places:
				lb_places.insert("end", destiny)

		show_all(self,lb_places, places)

		def start_button_f():
			print "X: %f Y: %f" % (self.result[0],self.result[1])
			p = coordinator()
			#planeador = getattr(p,vstpFunc)
			p.vstpFunc(0.5, 4, self.result[0], self.result[1])
			#limpa a lista no CGP e adiciona os novos pontos
			#p.addpoint_client(True)
			pagetwo_bol = True
			controller.show_frame(PageFive)



		label = Label(self, text="Choose where do you want to go and press Start:", font=tkFont.Font(size=20))
		label.place(x=350,y=0)
		back_btn = Button(self, text="Back", width=10, height=5, command=lambda:controller.show_frame(StartPage))
		back_btn.place(x=500,y=550)
		page_one = Button(self, text="Start", width=10, height=5, command=start_button_f)
		page_one.place(x=740,y=550)

class PageThree(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)



		self.k = StringVar()

		label = Label(self, text=self.k, font=tkFont.Font(size=40))
		label.pack(padx=10, pady=10)
		
		#page_one = Button(self, text="page4", command=lambda:controller.show_frame(PageFour))
		#page_one.pack()
		
		
		def run_at_call(self):
			global arrived_to
			if (number_tour == 1):
				arrived_to = str(tour1_dic[number]['local'])
			else:
				arrived_to = str(tour2_dic[number]['local'])
			self.k = "Heading to %s" % (arrived_to)
			label.configure(text=self.k)
			print "page3"
			print number

		def service_teste(self):
			controller.show_frame(PageFour)

		self.bind("<<ShowFrame>>", run_at_call)
		self.bind("<<chegou>>", service_teste)


class PageFour(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent, background = "green2")

		def next_destiny():
			#p=coordinator()
			#p.go_client()
			global number
			number = number + 1
			print "page4"
			print number
			controller.show_frame(PageThree)

		self.k =StringVar()

		label1 = Label(self, text = "You have arrived to your destination.", font=tkFont.Font(size=40), background="green2")
		label1.place(x=200,y=0)
		label = Label(self, text=self.k , font=tkFont.Font(size=40), background="green2")
		label.place(x=200,y=70)
		tour1_go = Button(self, text="Next Destination",width=10, height=5, command=next_destiny)
		tour1_go.place(x=1100,y=600)

		def run_at_call(self):
			self.k = "Welcome to %s" % (arrived_to)
			label.configure(text=self.k)
			
			if (number+1 == size_tour):
				controller.show_frame(PageSeven)
			
		self.bind("<<ShowFrame>>", run_at_call)


class PageFive(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)

		#texto = StringVar()
		
		#a = "hello"
		#You are heading to
		#self.k = "Heading to: %s" % (arrived_to2)
		self.k = StringVar()
		#self.k = "Heading to: " + str(arrived_to2)
		label = Label(self, text=self.k, font=tkFont.Font(size=40))
		label.pack(padx=10, pady=10)
		#page_six = Button(self, text="page6", command=lambda:controller.show_frame(PageSix))
		#page_six.pack()

		

		def run_at_call(self):
			print "update pageSFive"
			self.k = "Heading to %s" % (arrived_to2)
			print self.k
			label.configure(text=self.k)

			#self.text_update.set("Heading to: " + (arrived_to2))
			#self.label['text'] = self.text_update

		def service_teste(self):
			print "chegueiiii no GUI"
			controller.show_frame(PageSix)

		self.bind("<<ShowFrame>>", run_at_call)
		self.bind("<<chegou>>", service_teste)

class PageSix(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent, background = "green2")

		def send_home():
			p = coordinator()
			coord_home = places["Main Hall"]
			p.vstpFunc(0.5, 4, coord_home[0], coord_home[1])
			#p.addpoint_client(True)
			#p.go_client()
			controller.show_frame(StartPage)

		def send_place():
			controller.show_frame(PageTwo)

		self.k = StringVar()
		label1 = Label(self, text = "You have arrived to your destination.", font=tkFont.Font(size=40), background="green2")
		label1.place(x=200,y=0)
		label = Label(self, text=self.k , font=tkFont.Font(size=40), background="green2")
		label.place(x=200,y=70)
		label1 = Label(self, text="What do you want to do now?", font=tkFont.Font(size=40), bg="green2")
		label1.place(x=300, y=160)
		go_home = Button(self, text="Send Home",width=10, height=5, command=send_home)
		go_home.place(x=200, y=600)
		go_place = Button(self, text="Go To\n Another Place",width=10, height=5, command=send_place)
		go_place.place(x=1100, y=600)


		def run_at_call(self):
			self.k = "Welcome to %s" % (arrived_to2)
			label.configure(text=self.k)

		self.bind("<<ShowFrame>>", run_at_call)

class PageSeven(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent, background = "green2")

		def send_home():
			p = coordinator()
			coord_home = places["Main Hall"]
			p.vstpFunc(0.5, 4, coord_home[0], coord_home[1])
			#p.addpoint_client(True)
			#p.go_client()
			controller.show_frame(StartPage)


		self.k =StringVar()

		label1 = Label(self, text="You have arrived to the end of your tour.", font=tkFont.Font(size=40), bg="green2")
		label1.place(x=100, y=0)
		label = Label(self, text=self.k, font=tkFont.Font(size=40), bg="green2" )
		label.place(x=230, y=80)
		label1 = Label(self, text="What do you want to do now?", font=tkFont.Font(size=40), bg="green2")
		label1.place(x=280, y=160)
		send_home = Button(self, text="Send Home",width=10, height=5, command=send_home)
		send_home.place(x=1100, y=600)
		back = Button(self, text="Back to \nMain Screen",width=10, height=5, command=lambda:controller.show_frame(StartPage))
		back.place(x=100, y=600)

		def run_at_call(self):
			self.k = "Welcome to %s" % (arrived_to)
			label.configure(text=self.k)
			
		self.bind("<<ShowFrame>>", run_at_call)

class MainMenu:
	def __init__(self, master):
		menubar = Menu(master)
		filemenu = Menu(menubar, tearoff=0)
		filemenu.add_command(label="Exit", command=master.quit)
		filemenu.add_command(label="Main Page", command=lambda:controller.show_frame(StartPage))
		menubar.add_cascade(label="File", menu=filemenu)
		master.config(menu=menubar)

def criaGui():
	app = App()
	service2 = rospy.Service('arrivedDestiny', arrivedDestiny, app.handle_arrivedDestiny)
	app.title("Recepcionist Robot")
	app.mainloop()


def toThreadGui():
	guiThread = threading.Thread(target=criaGui)
	guiThread.daemon = True
	guiThread.start()
	#guiThread.join()

'''
STATE TABLE:
0-Stop
1-Go
2-Add Point
'''

class coordinator():
	#robotRadius = 0.65, why 0.74 
	def __init__(self,robotRadius=0.35,gridResolution=0.1,idealDist=0.5,maxDist=1):
		self.robotRadius=robotRadius
		'''
		self.gridResolution=gridResolution
		self.idealDist=idealDist
		self.maxDist=maxDist
		'''
		self.new_traj = list()
		self.aux_traj = Point()
		#self.odom_sub = rospy.Subscriber('/turtle1/pose', Pose, self.callbackOdom)
		#self.danger_sub = rospy.Subscriber('/sonarFlag', Bool, self.callbackSonar)
		#para o segway
		#self.odom_sub = rospy.Subscriber('/segway_rmp_node/odom', Odometry, self.callbackOdom)
		self.odom_sub = rospy.Subscriber('/odomUpdater', Pose2D, self.callbackFalseOdom)
		self.new_odom_sub = rospy.Subscriber('/new_odom',Pose2D,self.callbackOdom)
		self.v=vstpPY.VSTP() #criacao do objeto
		self.v.init(robotRadius,gridResolution,idealDist,maxDist)
		self.mapsegs = self.v.loadMap(MAP2)
		
		#self.serv_arrived = False


		self.pose=Pose2D()
		self.trueodomX=0
		self.trueodomY=0
		self.trueodomTheta=0
		self.falseodomX=0
		self.falseodomY=0
		self.falseodomTheta=0
		self.state=0
		self.traj_points=[]


	#Callback function implementing the pose value received
	def callbackFalseOdom(self, data):
		self.falseodomX=data.x
		self.falseodomY=data.y
		self.falseodomTheta=data.theta

	#callback function for the true odom = fake odom + error (camera)
	def callbackOdom(self,data):
		self.trueodomX=data.x
		self.trueodomY=data.y
		self.trueodomTheta=data.theta

#---------------------------------------------------------------------------------------------------------------------------#




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

	def addpoint_client(self, clear):
		rospy.wait_for_service('addpoint')
		try:
			addpoint_ = rospy.ServiceProxy('addpoint', addpoint)
			
			
			destArray = list()
			objectiveArrayPoint = list()
			destArraySize = len(self.myList)
			

			
			#code for file reading
			for elem in range(destArraySize):
				toappend = Point()
				toappend.x = float(self.myList[elem]['x'])
				toappend.y = float(self.myList[elem]['y'])
				destArray.append(toappend)

			print "\nPontos Destino:"
			print destArray

			'''
			#para usar o traj divider
			objectiveArray = self.trajDivider(destArray,30)
			objectiveArraySize = len(objectiveArray)

			for elem in range(objectiveArraySize):
				toappend = Point()
				toappend.x = objectiveArray[elem].x
				toappend.y = objectiveArray[elem].y
				objectiveArrayPoint.append(toappend)

			print "\nPontos Objectivo:"
			print objectiveArrayPoint
			'''



			#para usar uma segunda lista
			objectiveArray = self.myList2
			objectiveArraySize = len(self.myList2)

			for elem in range(objectiveArraySize):
				toappend = Point()
				toappend.x = float(self.myList2[elem]['x'])
				toappend.y = float(self.myList2[elem]['y'])
				objectiveArrayPoint.append(toappend)

			print "\nPontos Objectivo:"
			print objectiveArrayPoint
			#fim do uso da segunda lista
		




			'''
			#code for vstp trajectory points
			size=len(self.traj_points)

			for i in range(size):
				toappend = Point()
				toappend.x=self.traj_points[i].x
				toappend.y=self.traj_points[i].y
				pointArray.append(toappend)
			
			print "new point: " , pointArray
			'''
			
			resp1 = addpoint_.call(objectiveArrayPoint,destArray, clear, objectiveArraySize, destArraySize)

			print "Points added with sucess!"
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e

#---------------------------------------------------------------------------------------------------------------------------#

	def readFile(self,filename):
		self.myList = []
		with open (filename,'r') as rf:
			csv_DictReader = csv.DictReader(rf) 
			for row in csv_DictReader:
				self.myList.append(row)

	def readFile2(self,filename):
		self.myList2 = []
		with open (filename,'r') as rf:
			csv_DictReader = csv.DictReader(rf) 
			for row in csv_DictReader:
				self.myList2.append(row)
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

		self.mapminx=minx-2
		self.mapminy=miny-2
		self.mapmaxx=maxx
		self.mapmaxy=maxy
		print "minX: %f, minY: %f, MAXX: %f, MAXY: %f" % (self.mapminx,self.mapminy,self.mapmaxx,self.mapmaxy)

#---------------------------------------------------------------------------------------------------------------------------#
	'''
	def initScreen(self,dx=600,dy=680):
	        pygame.init()
	        self.displayx=dx
	        self.displayy=dy
	        self.screen = pygame.display.set_mode((dx, dy))
	        pygame.display.set_caption("Representacao da posicao do modulo RMP")
	        self.dispoffx=2
	        self.dispoffy=2

#---------------------------------------------------------------------------------------------------------------------------#

	def LoadMapNRobot(self):
	    self.v=vstpPY.VSTP()
	    self.v.init(self.robotRadius,self.gridResolution,self.idealDist,self.maxDist)
	    self.mapsegs = self.v.loadMap(MAP)

	    self.computeMapLimits()

	    self.raciox = (self.displayx-5)/(self.mapmaxx-self.mapminx)
	    self.racioy = (self.displayy-5)/(self.mapmaxy-self.mapminy)

	    #print "Racio: ", self.raciox
	'''

#---------------------------------------------------------------------------------------------------------------------------#
		
	def criaMapa(self,displayx=850,displayy=500):
	
		#raciox=(displayx-5)/(self.mapmaxx-self.mapminx)
		#racioy=(displayy-5)/(self.mapmaxy-self.mapminy)

		raciox=(800)/(self.mapmaxx-self.mapminx)
		racioy=(480)/(self.mapmaxy-self.mapminy)

		#gamepy inicialization window
		screen = pygame.display.set_mode((displayx, displayy))
		#screen = pygame.transform.flip(screen,0,1)

		pygame.display.set_caption("Representacao da posicao do modulo RMP")

		rate = rospy.Rate(5)
		while not rospy.is_shutdown():
		
			try:
				screen.fill((0,0,0))
				#map segments representation
				for i in range(len(self.mapsegs)):
					pygame.draw.line(screen, (255, 255, 255), ((self.mapsegs[i].x0-self.mapminx)*raciox, (self.mapsegs[i].y0-self.mapminy)*racioy),  ((self.mapsegs[i].x1-self.mapminx)*raciox, (self.mapsegs[i].y1-self.mapminy)*racioy))


				#trajectory representation
				'''
				for i in range(1,len(self.traj_points)):
					pygame.draw.line(screen, (0, 255,255), ((self.traj_points[i-1].x-self.mapminx)*raciox, (self.traj_points[i-1].y-self.mapminy)*racioy),  ((self.traj_points[i].x-self.mapminx)*raciox, (self.traj_points[i].y-self.mapminy)*racioy))
				'''

				for i in range(1,len(self.new_traj)):
					pygame.draw.line(screen, (0, 255,255), ((self.new_traj[i-1].x-self.mapminx)*raciox, (self.new_traj[i-1].y-self.mapminy)*racioy),  ((self.new_traj[i].x-self.mapminx)*raciox, (self.new_traj[i].y-self.mapminy)*racioy))
				
				#real odometry representation
				#pygame.draw.circle(screen, (255, 0, 0), [int((self.trueodomX-self.mapminx)*raciox), int((self.trueodomY-self.mapminy)*racioy)], int(self.robotRadius*raciox))
				#false odometry representation
				#pygame.draw.circle(screen, (255, 0, 0), [int((self.falseodomX-self.mapminx)*raciox), int((self.falseodomY-self.mapminy)*racioy)], int(self.robotRadius*raciox))



				
				pygame.display.flip()
				rate.sleep()


			except (KeyboardInterrupt, SystemExit, rospy.is_shutdown()):
				cleanup_stop_thread()
				pygame.quit()
				sys.exit()

#---------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------#	
			
	#thread para a const actualizacao da posicao do robot no display
	def toThreadMap(self):
		mapThread = threading.Thread(target=self.criaMapa)
		#mapThread = threading.Thread(target=self.criaGui)
		mapThread.daemon=True
		mapThread.start()
		mapThread.join()

#---------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------#

	#divisao do segmentos provenientes do VSTP em segmentos mais pequenos
	#scale -> tamanho maximo dos segmentos desejados
	def trajDivider(self,Lpontos,scale=1):
	
		size=len(Lpontos)


		for i in range(1,size):

			# inicializacao da nova trajectoria
			self.aux_traj.x = Lpontos[i-1].x
			self.aux_traj.y = Lpontos[i-1].y

			#calculo da distancia euclidiana
			d = math.sqrt(math.pow((Lpontos[i].x-Lpontos[i-1].x),2) + math.pow((Lpontos[i].y-Lpontos[i-1].y),2))
			#versor em X
			versorX = (Lpontos[i].x - Lpontos[i-1].x) / d
			#versor em Y
			versorY = (Lpontos[i].y - Lpontos[i-1].y) / d

			#quantas vezes cabe a minha scale na distancia entre os pontos
			#vezes que tenho de incrementar o ciclo
			k = int(math.ceil(d/scale))

			#valor do incremento por iteracao
			inc= d/k

			#print "d: %f versorX: %f versorY: %f k: %f inc: %f" % (d,versorX,versorY,k,inc)


			for j in xrange(k):
				self.aux_traj.x = self.aux_traj.x + (inc*versorX)
				self.aux_traj.y = self.aux_traj.y + (inc*versorY)
				self.new_traj.append(copy.deepcopy(self.aux_traj))
			

		print "\nlista final: \n" , self.new_traj
		return self.new_traj

#---------------------------------------------------------------------------------------------------------------------------#

	#funcao que quando chamada retorna a trajetoria de pontos
	def vstpFunc(self,iniX,iniY,goalx,goaly):
		print "\nPLANEADOR:"
		#coordenadas de partida (inicio)
		print "odomx: %f odomy: %f" % (iniX,iniY)
		#coordenadas de destino (fim)
		print "goalx: %f goaly: %f" % (goalx,goaly)

		self.traj_points = []
		self.computeMapLimits();
		self.traj_points =self.v.planTrajectory(iniX,iniY,goalx,goaly,True)
		#chamada a funcao que divide a trajectoria
		#self.trajDivider()
		#chamada a criacao do thread do mapa
		#self.toThread()
		
		#chamada servico para adicionar os pontos ao modulo de navegacao
		#self.addpoint_client()

#---------------------------------------------------------------------------------------------------------------------------#


if __name__ == "__main__":

	rospy.init_node("coordinator_node",anonymous=True)
	print "Coordinator Initialization..."
	#service2 = rospy.Service('arrivedDestiny', arrivedDestiny, handle_arrivedDestiny)
	boss=coordinator()
	boss.readFile(traj1)
	boss.readFile2(traj2)
	#boss.computeMapLimits()
	#boss.toThreadMap()
	toThreadGui()
	#boss.initScreen()
	#boss.LoadMapNRobot()

	#boss.vstpFunc(4,0.5,0.9,25)
	##boss.addpoint_client(False)

	print "Coordinator Ready!"
	rospy.spin()





	'''
	#boss.vstpFunc(0,0,55,0)

	#boss.vstpFunc(1,1,55,3,False)
	#boss.vstpFunc(55,3,55,10,False)
	#boss.addpoint_client()
	#boss.vstpFunc(2,2,0,0,False)

	#rospy.sleep(2.)	
	#boss.go_client()
	'''
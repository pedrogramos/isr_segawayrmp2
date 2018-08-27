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
#from PIL import ImageTk, Image


#to compile for ros
#chmod +x scripts/coordinator.py


places = {}

places ["Main Hall"] = [3.6,2.3]
places ["Lab: Mobile Robotics"] = [0.91,10.2]
places ["Accounting"] = [7.78,6.71]
places ["Lab: Computer Vision"] = [0.91,28.55]
places ["Lab: Immersive Systems"] = [0.91,25.8]
places ["Lab: Mechatronics"] = [21.21,10.2]
places ["Accounting 2"] = [13,6.71]

#arrived_to = places{1}


#no ISR
sys.path.insert(0,'/home/rmp/lib/python')
#MAP='/home/rmp/catkin_ws/src/RMPISR/scripts/ISRfile2.xml'
MAP='/home/rmp/catkin_ws/src/RMPISR/scripts/novo.xml'
import vstpPY
traj1='/home/rmp/catkin_ws/src/RMPISR/scripts/cen11.csv'

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

		for F in (StartPage, PageOne, PageTwo, PageThree, PageFour, PageFive, PageSix):
			frame = F(container, self)
			self.frames[F] = frame
			frame.grid(row=0, column=0, sticky="nsew")

		self.show_frame(StartPage)	
	def show_frame(self, context):
		frame = self.frames[context]
		frame.tkraise()

class StartPage(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)

		label = Label(self, text="Welcome to Instituto de Sistemas e Robotica!\n What do you want to do?", font=tkFont.Font(size=20))
		label.grid(padx=10, pady=10)

		page_one = Button(self, text="Do a Visit", width=15, height=10, font=tkFont.Font(size=20), command=lambda:controller.show_frame(PageOne))
		page_one.grid(row = 2,column = 2)
		page_two = Button(self, text="Go to Place", width=15, height=10, font=tkFont.Font(size=20), command=lambda:controller.show_frame(PageTwo))
		page_two.grid(row = 2,column =6)

class PageOne(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)

		def tour1():
			controller.show_frame(PageThree)
			tour1_bol = True
			tour2_bol = False
			p=coordinator()
			#chamada com a odom para o primeiro destino
			#p.vstpFunc(0.5, 4, coord_home[0], coord_home[1])
			'''
			for i in destinos:
				dest = places[value]
				p.vstpFunc(, 4, dest[0], dest[1])
			'''

		def tour2():
			controller.show_frame(PageThree)
			tour1_bol = False
			tour2_bol = True

		label = Label(self, text="Page One")
		label.pack(padx=10, pady=10)
		tour1_start = Button(self, text="Start", command=tour1)
		tour1_start.pack()
		tour2_start = Button(self, text="Start", command=tour2)
		tour2_start.pack()

class PageTwo(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)



		def choose(evt):
			w=evt.widget
			index=int(w.curselection()[0])
			value = w.get(index)
			self.result = places[value]

		lb_places = Listbox(self, width=20, height=15, font=tkFont.Font(size=20))
		lb_places.pack(padx=10, pady=20)
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
			controller.show_frame(PageThree)



		label = Label(self, text="Choose where do you want to go and press Start:", font=tkFont.Font(size=20))
		label.pack(padx=10, pady=10)
		back_btn = Button(self, text="Back", command=lambda:controller.show_frame(StartPage))
		back_btn.pack()
		page_one = Button(self, text="Start", command=start_button_f)
		page_one.pack()

class PageThree(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)
		'''
		#variavel do servico chegou ao destino -> chegou
		if(chegou=True): #chegou ao destino
			if(tour1_bol or tour2_bol) controller.show_frame(PageFour)
			if(pagetwo_bol) controller.show_frame(PageSix)
			#var=False
		'''

		#You are heading to
		#texto= "DESTINY: " + arrived_to
		label = Label(self, text="DESTINY: ", font=tkFont.Font(size=30))
		label.pack(padx=10, pady=10)
		page_one = Button(self, text="Start", command=lambda:controller.show_frame(PageFour))
		page_one.pack()


class PageFour(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent, background = "green")

		def next_destiny():
			p=coordinator()
			p.go_client()
			controller.show_frame(PageThree)

		label = Label(self, text="You arrived to %f" , font=tkFont.Font(size=20))
		label.pack(padx=10, pady=10)
		tour1_go = Button(self, text="Next Destiny", command=next_destiny)
		tour1_go.pack()


class PageFive(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent)

		label = Label(self, text="Page One")
		label.pack(padx=10, pady=10)
		tour1_go = Button(self, text="Go", command=lambda:controller.show_frame(StartPage))
		tour1_go.pack()
		tour2_go = Button(self, text="Page Two", command=lambda:controller.show_frame(PageTwo))
		tour2_go.pack()

class PageSix(Frame):
	def __init__(self, parent, controller):
		Frame.__init__(self, parent, background = "green")

		def send_home():
			p = coordinator()
			coord_home = places["Main Hall"]
			p.vstpFunc(0.5, 4, coord_home[0], coord_home[1])
			p.addpoint_client(True)
			p.go_client()
			controller.show_frame(StartPage)

		def send_place():
			controller.show_frame(PageTwo)

		label = Label(self, text="You arrived to ", font=tkFont.Font(size=20))
		label.pack(padx=10, pady=10)
		go_home = Button(self, text="Send Home", command=send_home)
		go_home.pack()
		go_place = Button(self, text="Go To Another Place", command=send_place)
		go_place.pack()

class MainMenu:
	def __init__(self, master):
		menubar = Menu(master)
		filemenu = Menu(menubar, tearoff=0)
		filemenu.add_command(label="Exit", command=master.quit)
		menubar.add_cascade(label="File", menu=filemenu)
		master.config(menu=menubar)

def criaGui():
	app = App()
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
		'''
		self.robotRadius=robotRadius
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
		self.mapsegs = self.v.loadMap(MAP)



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
			
			
			pointArray=list()
			size=len(self.myList)

			
			#code for file reading
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
			
			print "new point: " , pointArray
			'''
			
			resp1 = addpoint_.call(pointArray, clear, size)

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
		
	def criaMapa(self,displayx=800,displayy=480):
	
		raciox=(displayx-5)/(self.mapmaxx-self.mapminx)
		racioy=(displayy-5)/(self.mapmaxy-self.mapminy)

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
				pygame.draw.circle(screen, (255, 0, 0), [int((self.trueodomX-self.mapminx)*raciox), int((self.trueodomY-self.mapminy)*racioy)], int(self.robotRadius*raciox))
				#false odometry representation
				pygame.draw.circle(screen, (255, 0, 0), [int((self.falseodomX-self.mapminx)*raciox), int((self.falseodomY-self.mapminy)*racioy)], int(self.robotRadius*raciox))



				
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
	def trajDivider(self,scale=1):
		size=len(self.traj_points)


		for i in range(1,size):

			# inicializacao da nova trajectoria
			self.aux_traj.x = self.traj_points[i-1].x
			self.aux_traj.y = self.traj_points[i-1].y

			#calculo da distancia euclidiana
			d = math.sqrt(math.pow((self.traj_points[i].x-self.traj_points[i-1].x),2) + math.pow((self.traj_points[i].y-self.traj_points[i-1].y),2))
			#versor em X
			versorX = (self.traj_points[i].x - self.traj_points[i-1].x) / d
			#versor em Y
			versorY = (self.traj_points[i].y - self.traj_points[i-1].y) / d

			#quantas vezes cabe a minha scale na distancia entre os pontos
			#vezes que tenho de incrementar o ciclo
			k = int(math.ceil(d/scale))

			#valor do incremento por iteracao
			inc= d/k

			print "d: %f versorX: %f versorY: %f k: %f inc: %f" % (d,versorX,versorY,k,inc)


			for j in xrange(k):
				self.aux_traj.x = self.aux_traj.x + (inc*versorX)
				self.aux_traj.y = self.aux_traj.y + (inc*versorY)
				self.new_traj.append(copy.deepcopy(self.aux_traj))
			

		print "lista final: \n" , self.new_traj

#---------------------------------------------------------------------------------------------------------------------------#

	#funcao que quando chamada retorna a trajetoria de pontos
	def vstpFunc(self,iniX,iniY,goalx,goaly):
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
	boss=coordinator()
	boss.readFile(traj1)
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
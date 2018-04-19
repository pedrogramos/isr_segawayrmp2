#!/usr/bin/env python

import sys
from random import randint
import pygame
import threading

BLACK = (  0,   0,   0)
WHITE = (255, 255, 255)
RED   = (255,   0,   0)
GREEN = (0, 255, 0)
YELLOW =  (255,255,0)

#MAP = "/home/pm/CloudISR/AlunosMSc/PedroRamosTese/Codigo/python_vstp_ros/ISR_map.xml"
#MAP = "ISRfile2.xml"
#MAP = "goodmap.xml"
#MAP="exmap.xml"
MAP="novo.xml"

FPS = 30


#no meu pc
#sys.path.insert(0,'/home/pedrogramos/Desktop/Thesis/vstpPy/build/python')


#no ISR
sys.path.insert(0,'/home/pm/lib')
#sys.path.insert(0,'/home/rmp/ownCloud/PedroRamosTese/Codigo/vstpPy/scr')
import vstpPY


class robotTrajectory:

        def __init__(self):
                self.rectorig = pygame.rect.Rect(10,10,10,10)
                self.rectorig_draging=False;
                self.rectdest = pygame.rect.Rect(20,10,10,10)
                self.rectdest_draging=False;
                #self.limits=
                self.traj_points=[]

                
        def initScreen(self,dx=640,dy=480,cap="Sapiens"):
                pygame.init()
                self.displayx=dx
                self.displayy=dy
                self.caption=cap
                self.screen = pygame.display.set_mode((dx, dy))
                pygame.display.set_caption(cap)
                self.dispoffx=2
                self.dispoffy=2
                
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


        def mapDraw(self):
                #representation of the map segments on the window
                for i in range(len(self.mapsegs)):
                        pygame.draw.line(self.screen, (255, 255, 255),
                                         ((self.mapsegs[i].x0-self.mapminx)*self.raciox+self.dispoffx,(self.mapsegs[i].y0-self.mapminy)*self.racioy+self.dispoffy),
                                         ((self.mapsegs[i].x1-self.mapminx)*self.raciox+self.dispoffx, (self.mapsegs[i].y1-self.mapminy)*self.racioy+self.dispoffy))

                        
        def trajDraw(self):
                for i in range(1,len(self.traj_points)):
                        # print (i,traj_points[i-1].x,traj_points[i-1].y)                                 
                        # print (i,traj_points[i].x,traj_points[i].y)
                        
                        pygame.draw.line(self.screen, (255, 255,0),
                                         ((self.traj_points[i-1].x-self.mapminx)*self.raciox+self.dispoffx, (self.traj_points[i-1].y-self.mapminy)*self.racioy+self.dispoffy),
                                         ((self.traj_points[i].x-self.mapminx)*self.raciox+self.dispoffx, (self.traj_points[i].y-self.mapminy)*self.racioy+self.dispoffy))
                        


        def loadMapNRobot(self,mpath,rradius=0.35,gridres=0.10,idist=0.5,maxdist=1):
                self.robotradius=rradius
                self.vstp=vstpPY.VSTP()
                self.gridres=gridres
                self.idealdist=idist
                self.maxdist=maxdist
                self.vstp.init(rradius,gridres,idist,maxdist)
                self.mapsegs = self.vstp.loadMap(mpath)

                self.computeMapLimits()

                self.raciox=(self.displayx-5)/(self.mapmaxx-self.mapminx)
                self.racioy=(self.displayy-5)/(self.mapmaxy-self.mapminy)

        def go(self):                        
        
                #        segs_mapa, traj_points=vstpFunc(502,10,370,210,7.5,3,7,10)
                #       desenhaMapa(segs_mapa,traj_points)

                
                running = True
        
                while running:                
                        # - events -                
                        for event in pygame.event.get():
                                if event.type == pygame.QUIT:
                                        running = False                                
                                elif event.type == pygame.MOUSEBUTTONDOWN:
                                        if event.button == 1:            
                                                if self.rectorig.collidepoint(event.pos):
                                                        print("Na origem")
                                                        self.rectorig_draging = True
                                                        mouse_x, mouse_y = event.pos
                                                        offset_x = self.rectorig.x - mouse_x
                                                        offset_y = self.rectorig.y - mouse_y
                                                elif self.rectdest.collidepoint(event.pos):
                                                        print("no destino")
                                                        self.rectdest_draging = True
                                                        mouse_x, mouse_y = event.pos
                                                        offset_x = self.rectdest.x - mouse_x
                                                        offset_y = self.rectdest.y - mouse_y
                                elif event.type == pygame.MOUSEBUTTONUP:
                                        if event.button == 1:            
                                                if self.rectorig_draging or self.rectdest_draging:
                                                        self.traj_points = self.vstp.planTrajectory((self.rectorig.x-self.dispoffx)/self.raciox + self.mapminx,
                                                                                                    (self.rectorig.y-self.dispoffy)/self.racioy + self.mapminy,
                                                                                                    (self.rectdest.x-self.dispoffx)/self.raciox + self.mapminx,
                                                                                                    (self.rectdest.y- self.dispoffy)/self.racioy+self.mapminy,True)
                                                        self.rectorig_draging = False
                                                        self.rectdest_draging = False
                                                        
                                elif event.type == pygame.MOUSEMOTION:
                                        if self.rectorig_draging:
                                                mouse_x, mouse_y = event.pos
                                                self.rectorig.x = mouse_x + offset_x
                                                self.rectorig.y = mouse_y + offset_y
                                        elif self.rectdest_draging:
                                                mouse_x, mouse_y = event.pos
                                                self.rectdest.x = mouse_x + offset_x
                                                self.rectdest.y = mouse_y + offset_y
                                                        
                                # - updates (without draws) -
                                
                                # empty
                                
                                # - draws (without updates) -
                                                        
                                self.screen.fill(BLACK)
                                self.mapDraw()
                                if len(self.traj_points)>0:
                                        self.trajDraw()
                                
                                pygame.draw.rect(self.screen, RED, self.rectorig)
                                pygame.draw.rect(self.screen, GREEN, self.rectdest)
                                                        
                                pygame.display.flip()
                                                        
                                # - constant game speed / FPS -
                                
                                #clock.tick(FPS)
                                                        
                                                        # - end -

               

def prep():
    global dispath
    global MAP
    dispath=robotTrajectory()
    dispath.initScreen(800,600)
                
    dispath.loadMapNRobot(MAP)
    
        
if __name__ == "__main__":
        prep()
        dispath.go()
              


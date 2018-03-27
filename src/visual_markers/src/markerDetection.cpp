#include <iostream>
#include <fstream>
#include <ostream>

using namespace std;

#include <stdio.h>
#include <cstdlib>
#include <math.h>
#include <getopt.h>
#include <string>

#include "oasystem.h"

//#include "openarconfig.h"
//#include "system-gl.h"
//#include "system.h"
#include "debuginfo.h"
#include <SDL.h>
#include <cv.h>
#include "highgui.h"

#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/calib3d/calib3d.hpp"


#include "oaengine.h"
#include "oasimpleobj.h"
#include "ar.h"
#include "gridloc.h"
#include "bploc.h"

#include <ros/ros.h>
#include <signal.h>
#include "geometry_msgs/Pose2D.h"
#include "RMPISR/resetrmp.h"

/*! function to be called in case of an error generated by OpenCV
 */
int errcb( int status, const char* func_name,  const char* err_msg, const char* file_name, int line, void* userdata ){
  cerr <<"Error on "<<func_name<<", msg= "<<err_msg<<" file "<< file_name<<" line"<< line<<endl;

  cerr<< "OpenCV Error: "<<cvErrorStr(status)<<endl;
  abort();
#ifdef _WIN32
  return 0;
#endif
}


//#include <btBulletDynamicsCommon.h>

using namespace OpenAR;


GridLocator * startgridloc(ProjectiveCamera * cam){
  GridLocator* loc=new GridLocator();
  loc->setCameraModel(cam);
  return loc;
}


BPLocator * startbploc(ProjectiveCamera * cam){
  BPLocator * loc=new BPLocator(1);
  loc->setCameraModel(cam);
  return loc;
}

void serciceCall(geometry_msgs::Pose2D pose1,RMPISR::resetrmp srv, ros::ServiceClient client ){
  srv.request.pose.x = pose1.x;
  srv.request.pose.y = pose1.y;
  srv.request.pose.x = pose1.theta;

  client.call(srv);

}
//serviceCall(poseR,srv,client);

int main(int argc, char **argv){
	ros::init(argc, argv, "markerDetection_node");
  ros::NodeHandle nh;
  ros::ServiceClient client;
  client = nh.serviceClient<RMPISR::resetrmp>("resetrmp_");
  RMPISR::resetrmp srv;
  geometry_msgs::Pose2D poseR;
  cvRedirectError(errcb);
  MarkerLocator * locator=NULL;
  bool capture_from_cam=false;
  unsigned long start, now;
  int viewangle=5;	
  int numM=0;	
  
  // CvMatrix rotation(3,1,CV_64FC1);
  //CvMatrix translation(3,1,CV_64FC1);
  
  Pose pose, poseaux;	
  ProjectiveCamera cammodel;

  cv::Mat  iframe;
  cv::Mat  frame;
  cv::Mat  img;
  cv::Mat  img2;
  glm::mat4 cmT;
  bool doundistort=false;	

  // This part corresponds to the typical initialization of an application
	
  oaRenderer window;
  
  window.Init();
  window.CreateWindow(); 
  window.FinishSetup();
  window.setCamPose(0.0, 10.0, 0.0, 0.0, 0.0, -1.0, 0.0, 1.0, M_PI_2 );

  

  oaEngine engine;


  CvFont font;
  char msg[80];
  //cvInitFont( &font, CV_FONT_HERSHEY_COMPLEX, 1, 1, 0.0, 5, CV_AA );
  // engine.SetViewingAngle(30);
  viewangle=30;
  oaShader * shader1;
  shader1=engine.loadShaders("texture.vs","texture.fs");
 
  window.SetViewingAngle(glm::radians((float)viewangle));

  window.SetWindowTitle("MarkerLocator Demo");

  start = System::GetTicks();
  //SDL_EnableKeyRepeat(50, 50);
  //
  // a small trick for getting images from a camera or from an AVI file
  //
  cv::VideoCapture * capture;
  if( argc == 1 || (argc == 2 && strlen(argv[1]) == 1 && isdigit(argv[1][0]))){
      capture = new cv::VideoCapture( argc == 2 ? argv[1][0] - '0' : 0 );
#ifndef __APPLE__
      capture->set(CV_CAP_PROP_FRAME_WIDTH,800);
      capture->set(CV_CAP_PROP_FRAME_HEIGHT,600);
#endif
  }
  else if( argc == 2 ){
      capture = new cv::VideoCapture( argv[1] );
      capture_from_cam=false;
  }
	
  *capture >> iframe;

  if (!cammodel.LoadIntrinsicFile("camparam.cal")){
	printf("Error loading camera parameters\n");
	exit(1);
  } else 
      printf("Camera parameters loaded\n");

  oaCamera * cam;
  cam=new oaCamera;
  //cam->perspective(
  std::cout << "K="<<cammodel.IntrinsicMatrix<<std::endl;
  
  
  cam->setIntrinsics(cammodel,iframe.cols,iframe.rows,1,50000);
  //cam->setCamPose(Pose(0,0,0,1,0,0,M_PI));
  cam->lookat(0,0,0,0,0,1,0,-1,0);
  
  window.SetCamera(cam);
  
  //window.camera->setIntrinsics(cammodel,800,600,1,50000);
  

  // Insert an object in engine
  //IplImage *tex=cvLoadImage(DATADIR "/OpenAR/textures/tijolos1.bmp");

  // the main cycle
  // capture -> process -> display & process events
  sprintf(msg,"g - gridloc, b - bploc");

  	if (locator)
	delete locator;
    locator=startbploc(&cammodel);
    sprintf(msg,"Using bploc");
   
  for(;;) {

	now = System::GetTicks();
		
	// capture one image
	*capture >> iframe ;

	if (doundistort){
	    cv::undistort(iframe,frame,cammodel.IntrinsicMatrix,cammodel.DistortionCoefficients);
	}
	else 
	    frame = iframe.clone();				

	if (locator){
	  numM=locator->DetectMarker(frame);
	  //numM=0;
	  locator->DrawMarkerFeatures(frame);
	  printf("MarkerTotal = %d\n",numM);

	  for(int lk=0;lk<numM;lk++){
	
		  locator->useCVPose=true;
		  pose=locator->getMarkerPose(lk);
      cmT = pose.getRT();
      //printf("lckckxn %s", glm::to_String(cmT).c_str() );
			  
		  pose.print();				
	

	

		//----------------------------------------
		  
		  locator->useCVPose=false;
		  pose=locator->getMarkerPose(lk);
		printf("From Homography\n");
		pose.print();

		
	

	  }
	}
	cv::putText(frame,msg,cvPoint(10,50),cv::FONT_HERSHEY_SCRIPT_SIMPLEX,2, cv::Scalar::all(255),3,8);
	// set it as the opengl scene background

	engine.SetBGImage(frame);
	

	engine.renderScene(&window);

	

	}
	ros::spin();

}


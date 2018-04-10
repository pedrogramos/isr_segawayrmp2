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

//includes do zezoca
#include <glm/glm.hpp>
#include <glm/gtx/transform.hpp>
#include "glm/ext.hpp"
#include "pose.h"

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
//serviceCall(poseRMP,srv,client);

int main(int argc, char **argv){
  ros::init(argc, argv, "markerDetection_node");
  ros::NodeHandle nh;
  ros::ServiceClient client;
  client = nh.serviceClient<RMPISR::resetrmp>("resetrmp_");
  RMPISR::resetrmp srv;
  geometry_msgs::Pose2D poseRMP;


  cvRedirectError(errcb);
  MarkerLocator * locator=NULL;
  bool capture_from_cam=false;
  unsigned long start, now;
  int viewangle=5;  
  int numM=0, id; 
  
  // CvMatrix rotation(3,1,CV_64FC1);
  //CvMatrix translation(3,1,CV_64FC1);
  
  Pose pose, poseaux; 
  ProjectiveCamera cammodel;

  cv::Mat  iframe;
  cv::Mat  frame;
  cv::Mat  img;
  cv::Mat  img2;
  // distances from center of RMP to camera position
  float dx = 0.0;
  float dy = 350.0;
  float dz = 460.0;

  // rmpTc -> rigid tranf rmp to camera
  // cTm -> camara to marker
  // rmpTm -> rmp to marker
  // inv_rmpTm -> marker to rmp
  // wTrmp -> word to rmp

  glm::mat4 rmpTc;
  rmpTc[0] = glm::vec4(1.0,0.0,0.0,0.0);
  rmpTc[1] = glm::vec4(0.0,0.0,-1.0,0.0);
  rmpTc[2] = glm::vec4(0.0,1.0,0.0,0.0);
  rmpTc[3] = glm::vec4(dx,dy,dz,1.0);
  glm::mat4 cTm,rmpTm, inv_rmpTm, wTrmp;

  glm::mat4 wTc,inv_cTm;

  bool doundistort=false;
  //posicoes dos marcadores
  //marcador 1
  /*
  poseaux=Pose(0.0,0.0,800.0);
  glm::mat4 M0= poseaux.getRT();
  //glm::translate(glm::mat4(), glm::vec3(0.0,0.0,80.0))

  */




  // Transf World to Marker
  glm::mat4 M0, M1, M2, M3;
  glm::mat4 M_use;

  //para o teste:
  //1º ponto - Marker nº 
  Ma[0] = glm::vec4(1.0,0.0,0.0,0.0);
  Ma[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Ma[2] = glm::vec4(0.0,-1.0,0.0,0.0);
  Ma[3] = glm::vec4(0.0,0.0,800.0,1.0);

  //2º ponto - Marker nº 
  Mb[0] = glm::vec4(-1.0,0.0,0.0,0.0);
  Mb[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Mb[2] = glm::vec4(0.0,1.0,0.0,0.0);
  Mb[3] = glm::vec4(4983.0,0.0,800.0,1.0);

  //4º ponto - Marker nº 
  Mc[0] = glm::vec4(-1.0,0.0,0.0,0.0);
  Mc[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Mc[2] = glm::vec4(0.0,1.0,0.0,0.0);
  Mc[3] = glm::vec4(17652.0,0.0,800.0,1.0);

  //5º ponto - Marker nº  (depois da curva)
  Md[0] = glm::vec4(-1.0,0.0,0.0,0.0);
  Md[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Md[2] = glm::vec4(0.0,1.0,0.0,0.0);
  Md[3] = glm::vec4(18538.0,1816.0,800.0,1.0);
  


  M3[0] = glm::vec4(-1.0,0.0,0.0,0.0);
  M3[1] = glm::vec4(0.0,0.0,1.0,0.0);
  M3[2] = glm::vec4(0.0,1.0,0.0,0.0);
  M3[3] = glm::vec4(0.0,0.0,800.0,1.0);




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
    id=locator->getMarkerId(0);
    printf("MarkerTotal = %d with ID: %d\n",numM, id);

    if (id==1){
      M0[0] = glm::vec4(0.0,1.0,0.0,0.0);
      M0[1] = glm::vec4(0.0,0.0,1.0,0.0);
      M0[2] = glm::vec4(1.0,0.0,0.0,0.0);
      M0[3] = glm::vec4(0.0,0.0,800.0,1.0);
      M_use=M0;
      printf("Detectou o n 1\n");
  

    }

    else if (id==16 || id==78){
      M1[0] = glm::vec4(1.0,0.0,0.0,0.0);
      M1[1] = glm::vec4(0.0,0.0,1.0,0.0);
      M1[2] = glm::vec4(0.0,-1.0,0.0,0.0);
      M1[3] = glm::vec4(1800.0,5800.0,800.0,1.0);
      M_use=M1;
      printf("Detectou o n 16 ou 78\n");


    }

    else if (id==255){
      M2[0] = glm::vec4(0.0,-1.0,0.0,0.0);
      M2[1] = glm::vec4(0.0,0.0,1.0,0.0);
      M2[2] = glm::vec4(-1.0,0.0,0.0,0.0);
      M2[3] = glm::vec4(5000.0,4000.0,800.0,1.0);
      M_use=M2;
      printf("Detectou o n 255\n");

    }


    //for(int lk=0;lk<numM;lk++){
  
      locator->useCVPose=true;
      pose=locator->getMarkerPose(0);

      cTm = pose.getRT();
      /*
      inv_cTm=glm::inverse(cTm);

      wTc=M3*inv_cTm;
      */

      rmpTm=rmpTc*cTm;
      inv_rmpTm=glm::inverse(rmpTm);

      wTrmp=M_use*inv_rmpTm;
      

      poseRMP.x = wTrmp[3][0]/1000;
      poseRMP.y = wTrmp[3][1]/1000;
      poseRMP.theta = atan2((wTrmp[0][1]/1000),(wTrmp[0][0]/1000));

      printf("x=  %f y=  %f theta=  %f \n",poseRMP.x, poseRMP.y, poseRMP.theta );

      printf("M_use %s \n", glm::to_string(M_use).c_str() );
      printf("M0 %s \n", glm::to_string(M0).c_str() );
      printf("M1 %s \n", glm::to_string(M1).c_str() );
      printf("M2 %s \n", glm::to_string(M2).c_str() );
      printf("cTm %s \n", glm::to_string(cTm).c_str() );
      printf("wTc %s \n", glm::to_string(wTc).c_str() );
      printf("\n\n" );
      //printf("rmpTc %s \n", glm::to_string(rmpTc).c_str() );
     
      //printf("rmpTm %s \n", glm::to_string(rmpTm).c_str() );
      //printf("inv_rmpTm %s \n", glm::to_string(inv_rmpTm).c_str() );
      //printf("wTrmp %s \n", glm::to_string(wTrmp).c_str() );

        
      pose.print();

  

  

    //----------------------------------------
      
      locator->useCVPose=false;
      pose=locator->getMarkerPose(0);
      printf("From Homography\n");
      pose.print();


      id=0;

    
  //serviceCall(poseRMP,srv,client);

   // }
  }
  cv::putText(frame,msg,cvPoint(10,50),cv::FONT_HERSHEY_SCRIPT_SIMPLEX,2, cv::Scalar::all(255),3,8);
  // set it as the opengl scene background

  engine.SetBGImage(frame);
  

  engine.renderScene(&window);

  

  }

  return 0;


}


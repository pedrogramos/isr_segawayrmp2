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
#include "RMPISR/odomError.h"
#include "RMPISR/resetrmp.h"
#include "RMPISR/markerdetected.h"
#include <time.h>
#include <vector>
#include <string>

double odomX, odomY, odomTheta;

/*! function to be called in case of an error generated by OpenCV
 */
int errcb( int status, const char* func_name,  const char* err_msg, const char* file_name, int line, void* userdata ){
  cerr <<"Error on "<<func_name<<", msg= "<<err_msg<<" file "<< file_name<<" line"<< line<<endl;

  cerr<< "OpenCV Error: "<<cvErrorStr(status) << endl;
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
  BPLocator * loc=new BPLocator(2);
  loc->setCameraModel(cam);
  return loc;
}


void serciceCall(geometry_msgs::Pose2D pose1,RMPISR::odomError srv, ros::ServiceClient client ){
  srv.request.pose.x = pose1.x;
  srv.request.pose.y = pose1.y;
  srv.request.pose.theta = pose1.theta;

  client.call(srv);

}


void serciceCallOnce(geometry_msgs::Pose2D pose1,RMPISR::resetrmp srv2, ros::ServiceClient client2 ){
  srv2.request.pose.x = pose1.x;
  srv2.request.pose.y = pose1.y;
  srv2.request.pose.theta = pose1.theta;

  client2.call(srv2);

}

//funcao que le valores dos marcadores do ficheiro texto
std::vector<float> readFile(string path){
  float value;
  string discard;
  std::vector<float> aux;

  ifstream myReadFile;
  myReadFile.open(path.c_str());
  if (myReadFile.is_open()) {
    while (myReadFile >> discard >> value) {
      
      //fscanf(myReadFile,"%s %f",discard, value)
      aux.push_back(value);

          
    }
  }

  else cout << "Não consegui aceder ao ficheiro." << endl;
  myReadFile.close();


//percorrer o vector e fazer print dos valores
for (std::vector<float>::const_iterator i = aux.begin(); i != aux.end(); ++i)
    std::cout << *i << ' ';
  cout << endl;


return aux;

}

/*
void odomCallback(const geometry_msgs::Pose2D::ConstPtr& msg){
odomX=msg->x;
odomY=msg->y;
odomTheta=msg->theta;

//ROS_INFO("OdometriaFun: X= %f, Y= %f, e Theta= %f", odomX,odomY,odomTheta);
}*/

int main(int argc, char **argv){
  ros::init(argc, argv, "markerDetection_node");
  ros::NodeHandle nh;
  ros::ServiceClient client, client2, client3;
  ros::Subscriber odom_sub;
  // nh.serviceClient<nome do ficheiro>("nome em que o serviço é disponibilizado");
  client = nh.serviceClient<RMPISR::odomError>("odomError");
  client2 = nh.serviceClient<RMPISR::resetrmp>("resetRMP");
  client3 = nh.serviceClient<RMPISR::markerdetected>("markerdetected");
  //odom_sub =  nh.subscribe("odomUpdater",10,odomCallback);
  RMPISR::odomError srv;
  RMPISR::resetrmp srv2;
  RMPISR::markerdetected srv3;
  geometry_msgs::Pose2D trueOdom;
  bool entrar = true;
  bool once = true;
  std::vector<float> setValues;
  std::ofstream outfile ("test.txt");
  time_t rawtime;
  struct tm * timeinfo;




  cvRedirectError(errcb);
  MarkerLocator * locator=NULL;
  bool capture_from_cam=false;
  unsigned long start, now;
  int viewangle=5;  
  int numM=0, id, id_ant; 
  
  // CvMatrix rotation(3,1,CV_64FC1);
  //CvMatrix translation(3,1,CV_64FC1);
  
  Pose pose, poseaux; 
  ProjectiveCamera cammodel;

  cv::Mat  iframe;
  cv::Mat  frame;
  cv::Mat  img;
  cv::Mat  img2;
  bool doundistort=false;


//-----------------------------------------------------//

setValues = readFile("/home/rmp/catkin_ws/src/visual_markers/src/markersSettings.txt");

  // rmpTc -> rigid tranf rmp to camera
  // cTm -> camara to marker (script calculates)
  // rmpTm -> rmp to marker
  // mTrmp -> marker to rmp
  // wTrmp -> word to rmp

  glm::mat4 rmpTc;
  rmpTc[0] = glm::vec4(1.0,0.0,0.0,0.0);
  rmpTc[1] = glm::vec4(0.0,0.0,-1.0,0.0);
  rmpTc[2] = glm::vec4(0.0,1.0,0.0,0.0);
  rmpTc[3] = glm::vec4(0.0,350.0,750.0,1.0);
  glm::mat4 cTm,rmpTm, mTrmp, wTrmp;

  glm::mat4 wTc,inv_cTm;




//-----------------------------------------------------//

  // Transf World to Marker
  glm::mat4 M0, M1, M2, M3;
  glm::mat4 M_use;

  M0[0] = glm::vec4(0.0,1.0,0.0,0.0);
  M0[1] = glm::vec4(0.0,0.0,1.0,0.0);
  M0[2] = glm::vec4(1.0,0.0,0.0,0.0);
  M0[3] = glm::vec4(0.0,0.0,800.0,1.0);

  M1[0] = glm::vec4(1.0,0.0,0.0,0.0);
  M1[1] = glm::vec4(0.0,0.0,1.0,0.0);
  M1[2] = glm::vec4(0.0,-1.0,0.0,0.0);
  M1[3] = glm::vec4(1800.0,5800.0,800.0,1.0);

  M2[0] = glm::vec4(0.0,-1.0,0.0,0.0);
  M2[1] = glm::vec4(0.0,0.0,1.0,0.0);
  M2[2] = glm::vec4(-1.0,0.0,0.0,0.0);
  M2[3] = glm::vec4(5000.0,4000.0,800.0,1.0);

  M3[0] = glm::vec4(-1.0,0.0,0.0,0.0);
  M3[1] = glm::vec4(0.0,0.0,1.0,0.0);
  M3[2] = glm::vec4(0.0,1.0,0.0,0.0);
  M3[3] = glm::vec4(0.0,0.0,800.0,1.0);


  //para a demostração
  glm::mat4 Ma, Mb, Mc, Md, Mc2, novo;

  //para o teste:
  //1º ponto - Marker nº 111
  Ma[0] = glm::vec4(1.0,0.0,0.0,0.0);
  Ma[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Ma[2] = glm::vec4(0.0,-1.0,0.0,0.0);
  Ma[3] = glm::vec4(setValues.at(1),setValues.at(2),setValues.at(3),1.0);

  //2º ponto - Marker nº 127
  Mb[0] = glm::vec4(1.0,0.0,0.0,0.0);
  Mb[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Mb[2] = glm::vec4(0.0,-1.0,0.0,0.0);
  Mb[3] = glm::vec4(setValues.at(4),setValues.at(5),setValues.at(6),1.0);

  //4º ponto - Marker nº 150
  Mc[0] = glm::vec4(0.0,1.0,0.0,0.0);
  Mc[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Mc[2] = glm::vec4(1.0,0.0,0.0,0.0);
  Mc[3] = glm::vec4(setValues.at(7),setValues.at(8),setValues.at(9),1.0);

  Mc2[0] = glm::vec4(-1.0,0.0,0.0,0.0);
  Mc2[1] = glm::vec4(0.0,0.0,-1.0,0.0);
  Mc2[2] = glm::vec4(0.0,-1.0,0.0,0.0);
  Mc2[3] = glm::vec4(setValues.at(10),setValues.at(11),setValues.at(12),1.0);


  //3º ponto - Marker nº 200
  Md[0] = glm::vec4(0.0,1.0,0.0,0.0);
  Md[1] = glm::vec4(0.0,0.0,1.0,0.0);
  Md[2] = glm::vec4(1.0,0.0,0.0,0.0);
  Md[3] = glm::vec4(setValues.at(10),setValues.at(11),setValues.at(12),1.0);


  // This part corresponds to the typical initialization of an application
  
  oaRenderer window;
  
  window.Init();
  window.CreateWindow(); 
  window.FinishSetup();
  window.setCamPose(0.0, 10.0, 0.0, 0.0, 0.0, -1.0, 0.0, 1.0, M_PI_2 );

  

  oaEngine engine;


  CvFont font;
  char msg[80];
  char msg3[80], msg4[80];
  //cvInitFont( &font, CV_FONT_HERSHEY_COMPLEX, 1, 1, 0.0, 5, CV_AA );
  // engine.SetViewingAngle(30);
  viewangle=30;
  oaShader * shader1;
  shader1=engine.loadShaders("texture.vs","texture.fs");
 
  window.SetViewingAngle(glm::radians((float)viewangle));

  window.SetWindowTitle("MarkerLocator");

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


    if (locator)
  delete locator;
    locator=startbploc(&cammodel);



   
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

    //printf("MarkerTotal = %d with ID: %d\n",numM, id);

    //if (id =! id_ant){




        for(int lk=0;lk<numM;lk++){
      
          locator->useCVPose=true;
          pose=locator->getMarkerPose(lk);
          id=locator->getMarkerId(lk);

          /*
          if (i!=0){
            outfile << "Odom " << i << "-> X: "<< odomX << "Y: "<< odomY << "theta: " << odomTheta << std::endl;
            i--;
          }*/

          sprintf(msg3,"Measure to marker center: %f",pose.position.norm());
          cv::putText(frame,msg3,cvPoint(0,50),cv::FONT_HERSHEY_SIMPLEX,1,cv::Scalar::all(100),3,8);
          //M_use=Ma;

          if (id==111){
            M_use=Ma;
            printf("Detectou o n 111\n");
              if(id != 111) entrar=true;
          }

          else if (id==127){
            M_use=Mb;
            printf("Detectou o n 127\n");
            if(id_ant != 127) entrar=true;
          }

          else if (id==200){
            M_use=Md;
            printf("Detectou o n 200\n");
            if(id_ant != 200) entrar=true;

          }

          else if (id==150){
            M_use=Mc;
            printf("Detectou o n 150\n");
            if(id_ant != 150) entrar=true;
          }


          cTm = pose.getRT();
          
          inv_cTm=glm::inverse(cTm);

          wTc=M_use*inv_cTm;
          
          
          rmpTm=rmpTc*cTm;
          mTrmp=glm::inverse(rmpTm);
          wTrmp=M_use*mTrmp;

          glm::vec4 novo =wTrmp*glm::vec4(1.0,0.0,0.0,0.0);
          float norma = sqrt(pow(novo[0],2)+pow(novo[1],2));

          trueOdom.x = ((wTrmp[3][0])/1000);
          trueOdom.y = ((wTrmp[3][1])/1000);
          trueOdom.theta = (atan2((wTrmp[0][1]),(wTrmp[0][0])));

        //printf("Xcam=  %f Ycam=  %f ThCam=  %f \n",(wTc[3][0])/1000, (wTc[3][1])/1000, atan2((wTc[0][1]),(wTc[0][0])) );
        //printf("OLD: x=  %f y=  %f theta=  %f \n",((wTrmp[3][0])/1000), ((wTrmp[3][1])/1000), (atan2((wTrmp[0][1]),(wTrmp[0][0]))) );
        //printf("NOVO: x=  %f y=  %f theta=  %f \n",((wTrmp[3][0])/1000), ((wTrmp[3][1])/1000), atan2((wTrmp[0][1]/norma),(wTrmp[0][0]/norma)) );

        sprintf(msg4,"x=  %f y=  %f theta=  %f ",((wTrmp[3][0])/1000), ((wTrmp[3][1])/1000), (atan2((wTrmp[0][1]),(wTrmp[0][0]))) );
        cv::putText(frame,msg4,cvPoint(0,100),cv::FONT_HERSHEY_SIMPLEX,1,cv::Scalar::all(100),3,8);

        //printf("M_use %s \n", glm::to_string(M_use).c_str() );


          
        id_ant=id;

        if (once){
          printf("Inicializacao da odometria! \n");
          serciceCallOnce(trueOdom,srv2,client2);
          once = false;
          entrar = false;
          ros::Duration(1).sleep();
        }

      
        if(entrar){
          printf("ENTROU CHAMADA SERVICO!!\n");
          time ( &rawtime );
          timeinfo = localtime ( &rawtime );
          //string a =fprintf( "The current date/time is: %s", asctime (timeinfo) );

          /*
          outfile << asctime (timeinfo);
          outfile << "Detectou o id: " << id << std::endl;
          outfile << "srv call-> X: "<< erro.x << " Y: "<< erro.y << " th: " << erro.theta << std::endl;
          */

          // call do servico que envia o calculo do erro para ser adicionado à odometria original
          serciceCall(trueOdom,srv,client);
          client3.call(srv3);

          // cout para a consola
          std::cout << asctime (timeinfo);
          //printf("MArker: X=  %f Y=  %f Th=  %f \n",(wTrmp[3][0])/1000), ((wTrmp[3][1])/1000), (atan2((wTrmp[0][1]),(wTrmp[0][0])));
          //printf("Odom X= %f Y= %f Th= %f \n",odomX, odomY, odomTheta);
          std::cout << "srv call-> X: "<< trueOdom.x << " Y: "<< trueOdom.y << " Th: " << trueOdom.theta << std::endl;
          //i=2;
          //lastTime = ros::Time::now();

          entrar = false;

        }

          printf("\n\n" );
          ros::spinOnce();
        }
  
  //cv::putText(frame,msg,cvPoint(10,50),cv::FONT_HERSHEY_SIMPLEX,1, cv::Scalar::all(255),3,8);
  // set it as the opengl scene background

  engine.SetBGImage(frame);
  

  engine.renderScene(&window);
/*
  SDL_Event ev;
  while(SDL_PollEvent(&ev)) {
    switch(ev.type) {
      case SDL_QUIT:
        return 0;
      break;

      case SDLK_q:
        return 0;

      default:
        std::cout << "key"<< std::endl;
      break;
    }
    break;
  }*/


  }

}
  
  outfile.close();
  return 0;



}


;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::resetrmp)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'resetrmp (find-package "RMPISR")))
(unless (find-package "RMPISR::RESETRMP")
  (make-package "RMPISR::RESETRMP"))
(unless (find-package "RMPISR::RESETRMPREQUEST")
  (make-package "RMPISR::RESETRMPREQUEST"))
(unless (find-package "RMPISR::RESETRMPRESPONSE")
  (make-package "RMPISR::RESETRMPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass RMPISR::resetrmpRequest
  :super ros::object
  :slots (_pose ))

(defmethod RMPISR::resetrmpRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass RMPISR::resetrmpResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::resetrmpResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass RMPISR::resetrmp
  :super ros::object
  :slots ())

(setf (get RMPISR::resetrmp :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get RMPISR::resetrmp :datatype-) "RMPISR/resetrmp")
(setf (get RMPISR::resetrmp :request) RMPISR::resetrmpRequest)
(setf (get RMPISR::resetrmp :response) RMPISR::resetrmpResponse)

(defmethod RMPISR::resetrmpRequest
  (:response () (instance RMPISR::resetrmpResponse :init)))

(setf (get RMPISR::resetrmpRequest :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get RMPISR::resetrmpRequest :datatype-) "RMPISR/resetrmpRequest")
(setf (get RMPISR::resetrmpRequest :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---

")

(setf (get RMPISR::resetrmpResponse :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get RMPISR::resetrmpResponse :datatype-) "RMPISR/resetrmpResponse")
(setf (get RMPISR::resetrmpResponse :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---

")



(provide :RMPISR/resetrmp "271cb12677c4cd9bccbc642cd9258d1f")



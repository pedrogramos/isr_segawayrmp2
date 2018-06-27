;; Auto-generated. Do not edit!


(when (boundp 'testeturtle::resetrmp)
  (if (not (find-package "TESTETURTLE"))
    (make-package "TESTETURTLE"))
  (shadow 'resetrmp (find-package "TESTETURTLE")))
(unless (find-package "TESTETURTLE::RESETRMP")
  (make-package "TESTETURTLE::RESETRMP"))
(unless (find-package "TESTETURTLE::RESETRMPREQUEST")
  (make-package "TESTETURTLE::RESETRMPREQUEST"))
(unless (find-package "TESTETURTLE::RESETRMPRESPONSE")
  (make-package "TESTETURTLE::RESETRMPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass testeturtle::resetrmpRequest
  :super ros::object
  :slots (_pose ))

(defmethod testeturtle::resetrmpRequest
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

(defclass testeturtle::resetrmpResponse
  :super ros::object
  :slots ())

(defmethod testeturtle::resetrmpResponse
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

(defclass testeturtle::resetrmp
  :super ros::object
  :slots ())

(setf (get testeturtle::resetrmp :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get testeturtle::resetrmp :datatype-) "testeturtle/resetrmp")
(setf (get testeturtle::resetrmp :request) testeturtle::resetrmpRequest)
(setf (get testeturtle::resetrmp :response) testeturtle::resetrmpResponse)

(defmethod testeturtle::resetrmpRequest
  (:response () (instance testeturtle::resetrmpResponse :init)))

(setf (get testeturtle::resetrmpRequest :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get testeturtle::resetrmpRequest :datatype-) "testeturtle/resetrmpRequest")
(setf (get testeturtle::resetrmpRequest :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
")

(setf (get testeturtle::resetrmpResponse :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get testeturtle::resetrmpResponse :datatype-) "testeturtle/resetrmpResponse")
(setf (get testeturtle::resetrmpResponse :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
")



(provide :testeturtle/resetrmp "271cb12677c4cd9bccbc642cd9258d1f")



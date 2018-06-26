;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::odomError)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'odomError (find-package "RMPISR")))
(unless (find-package "RMPISR::ODOMERROR")
  (make-package "RMPISR::ODOMERROR"))
(unless (find-package "RMPISR::ODOMERRORREQUEST")
  (make-package "RMPISR::ODOMERRORREQUEST"))
(unless (find-package "RMPISR::ODOMERRORRESPONSE")
  (make-package "RMPISR::ODOMERRORRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass RMPISR::odomErrorRequest
  :super ros::object
  :slots (_pose ))

(defmethod RMPISR::odomErrorRequest
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

(defclass RMPISR::odomErrorResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::odomErrorResponse
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

(defclass RMPISR::odomError
  :super ros::object
  :slots ())

(setf (get RMPISR::odomError :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get RMPISR::odomError :datatype-) "RMPISR/odomError")
(setf (get RMPISR::odomError :request) RMPISR::odomErrorRequest)
(setf (get RMPISR::odomError :response) RMPISR::odomErrorResponse)

(defmethod RMPISR::odomErrorRequest
  (:response () (instance RMPISR::odomErrorResponse :init)))

(setf (get RMPISR::odomErrorRequest :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get RMPISR::odomErrorRequest :datatype-) "RMPISR/odomErrorRequest")
(setf (get RMPISR::odomErrorRequest :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
")

(setf (get RMPISR::odomErrorResponse :md5sum-) "271cb12677c4cd9bccbc642cd9258d1f")
(setf (get RMPISR::odomErrorResponse :datatype-) "RMPISR/odomErrorResponse")
(setf (get RMPISR::odomErrorResponse :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
")



(provide :RMPISR/odomError "271cb12677c4cd9bccbc642cd9258d1f")



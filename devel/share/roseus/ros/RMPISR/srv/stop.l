;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::stop)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'stop (find-package "RMPISR")))
(unless (find-package "RMPISR::STOP")
  (make-package "RMPISR::STOP"))
(unless (find-package "RMPISR::STOPREQUEST")
  (make-package "RMPISR::STOPREQUEST"))
(unless (find-package "RMPISR::STOPRESPONSE")
  (make-package "RMPISR::STOPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass RMPISR::stopRequest
  :super ros::object
  :slots (_size _pointArray ))

(defmethod RMPISR::stopRequest
  (:init
   (&key
    ((:size __size) 0)
    ((:pointArray __pointArray) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _size (round __size))
   (setq _pointArray __pointArray)
   self)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:pointArray
   (&rest __pointArray)
   (if (keywordp (car __pointArray))
       (send* _pointArray __pointArray)
     (progn
       (if __pointArray (setq _pointArray (car __pointArray)))
       _pointArray)))
  (:serialization-length
   ()
   (+
    ;; uint8 _size
    1
    ;; geometry_msgs/Point _pointArray
    (send _pointArray :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _size
       (write-byte _size s)
     ;; geometry_msgs/Point _pointArray
       (send _pointArray :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _size
     (setq _size (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Point _pointArray
     (send _pointArray :deserialize buf ptr-) (incf ptr- (send _pointArray :serialization-length))
   ;;
   self)
  )

(defclass RMPISR::stopResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::stopResponse
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

(defclass RMPISR::stop
  :super ros::object
  :slots ())

(setf (get RMPISR::stop :md5sum-) "5bbea48bfb057c91b7a5e97f25876fc2")
(setf (get RMPISR::stop :datatype-) "RMPISR/stop")
(setf (get RMPISR::stop :request) RMPISR::stopRequest)
(setf (get RMPISR::stop :response) RMPISR::stopResponse)

(defmethod RMPISR::stopRequest
  (:response () (instance RMPISR::stopResponse :init)))

(setf (get RMPISR::stopRequest :md5sum-) "5bbea48bfb057c91b7a5e97f25876fc2")
(setf (get RMPISR::stopRequest :datatype-) "RMPISR/stopRequest")
(setf (get RMPISR::stopRequest :definition-)
      "uint8 size
geometry_msgs/Point pointArray

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get RMPISR::stopResponse :md5sum-) "5bbea48bfb057c91b7a5e97f25876fc2")
(setf (get RMPISR::stopResponse :datatype-) "RMPISR/stopResponse")
(setf (get RMPISR::stopResponse :definition-)
      "uint8 size
geometry_msgs/Point pointArray

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :RMPISR/stop "5bbea48bfb057c91b7a5e97f25876fc2")



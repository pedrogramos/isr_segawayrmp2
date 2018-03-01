;; Auto-generated. Do not edit!


(when (boundp 'RMPISR::addpoint)
  (if (not (find-package "RMPISR"))
    (make-package "RMPISR"))
  (shadow 'addpoint (find-package "RMPISR")))
(unless (find-package "RMPISR::ADDPOINT")
  (make-package "RMPISR::ADDPOINT"))
(unless (find-package "RMPISR::ADDPOINTREQUEST")
  (make-package "RMPISR::ADDPOINTREQUEST"))
(unless (find-package "RMPISR::ADDPOINTRESPONSE")
  (make-package "RMPISR::ADDPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass RMPISR::addpointRequest
  :super ros::object
  :slots (_pointArray _type _size ))

(defmethod RMPISR::addpointRequest
  (:init
   (&key
    ((:pointArray __pointArray) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:type __type) nil)
    ((:size __size) 0)
    )
   (send-super :init)
   (setq _pointArray __pointArray)
   (setq _type __type)
   (setq _size (round __size))
   self)
  (:pointArray
   (&rest __pointArray)
   (if (keywordp (car __pointArray))
       (send* _pointArray __pointArray)
     (progn
       (if __pointArray (setq _pointArray (car __pointArray)))
       _pointArray)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _pointArray
    (apply #'+ (send-all _pointArray :serialization-length)) 4
    ;; bool _type
    1
    ;; uint8 _size
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _pointArray
     (write-long (length _pointArray) s)
     (dolist (elem _pointArray)
       (send elem :serialize s)
       )
     ;; bool _type
       (if _type (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _size
       (write-byte _size s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _pointArray
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pointArray (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _pointArray)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _type
     (setq _type (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _size
     (setq _size (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass RMPISR::addpointResponse
  :super ros::object
  :slots ())

(defmethod RMPISR::addpointResponse
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

(defclass RMPISR::addpoint
  :super ros::object
  :slots ())

(setf (get RMPISR::addpoint :md5sum-) "77e78fdbf22a409a15b41bafedb3fda3")
(setf (get RMPISR::addpoint :datatype-) "RMPISR/addpoint")
(setf (get RMPISR::addpoint :request) RMPISR::addpointRequest)
(setf (get RMPISR::addpoint :response) RMPISR::addpointResponse)

(defmethod RMPISR::addpointRequest
  (:response () (instance RMPISR::addpointResponse :init)))

(setf (get RMPISR::addpointRequest :md5sum-) "77e78fdbf22a409a15b41bafedb3fda3")
(setf (get RMPISR::addpointRequest :datatype-) "RMPISR/addpointRequest")
(setf (get RMPISR::addpointRequest :definition-)
      "geometry_msgs/Point[] pointArray
bool type
uint8 size

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get RMPISR::addpointResponse :md5sum-) "77e78fdbf22a409a15b41bafedb3fda3")
(setf (get RMPISR::addpointResponse :datatype-) "RMPISR/addpointResponse")
(setf (get RMPISR::addpointResponse :definition-)
      "geometry_msgs/Point[] pointArray
bool type
uint8 size

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :RMPISR/addpoint "77e78fdbf22a409a15b41bafedb3fda3")



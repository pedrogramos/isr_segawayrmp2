;; Auto-generated. Do not edit!


(when (boundp 'testeturtle::addpoint)
  (if (not (find-package "TESTETURTLE"))
    (make-package "TESTETURTLE"))
  (shadow 'addpoint (find-package "TESTETURTLE")))
(unless (find-package "TESTETURTLE::ADDPOINT")
  (make-package "TESTETURTLE::ADDPOINT"))
(unless (find-package "TESTETURTLE::ADDPOINTREQUEST")
  (make-package "TESTETURTLE::ADDPOINTREQUEST"))
(unless (find-package "TESTETURTLE::ADDPOINTRESPONSE")
  (make-package "TESTETURTLE::ADDPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass testeturtle::addpointRequest
  :super ros::object
  :slots (_pointArray _type _size ))

(defmethod testeturtle::addpointRequest
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
    ;; int32 _size
    4
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
     ;; int32 _size
       (write-long _size s)
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
   ;; int32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass testeturtle::addpointResponse
  :super ros::object
  :slots ())

(defmethod testeturtle::addpointResponse
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

(defclass testeturtle::addpoint
  :super ros::object
  :slots ())

(setf (get testeturtle::addpoint :md5sum-) "7da3ac5df9a593780eabd65b2f6b4ceb")
(setf (get testeturtle::addpoint :datatype-) "testeturtle/addpoint")
(setf (get testeturtle::addpoint :request) testeturtle::addpointRequest)
(setf (get testeturtle::addpoint :response) testeturtle::addpointResponse)

(defmethod testeturtle::addpointRequest
  (:response () (instance testeturtle::addpointResponse :init)))

(setf (get testeturtle::addpointRequest :md5sum-) "7da3ac5df9a593780eabd65b2f6b4ceb")
(setf (get testeturtle::addpointRequest :datatype-) "testeturtle/addpointRequest")
(setf (get testeturtle::addpointRequest :definition-)
      "geometry_msgs/Point[] pointArray
bool type
int32 size

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get testeturtle::addpointResponse :md5sum-) "7da3ac5df9a593780eabd65b2f6b4ceb")
(setf (get testeturtle::addpointResponse :datatype-) "testeturtle/addpointResponse")
(setf (get testeturtle::addpointResponse :definition-)
      "geometry_msgs/Point[] pointArray
bool type
int32 size

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :testeturtle/addpoint "7da3ac5df9a593780eabd65b2f6b4ceb")



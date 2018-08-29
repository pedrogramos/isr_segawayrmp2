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
  :slots (_pointArray _destArray _type _size _size_dest ))

(defmethod RMPISR::addpointRequest
  (:init
   (&key
    ((:pointArray __pointArray) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:destArray __destArray) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:type __type) nil)
    ((:size __size) 0)
    ((:size_dest __size_dest) 0)
    )
   (send-super :init)
   (setq _pointArray __pointArray)
   (setq _destArray __destArray)
   (setq _type __type)
   (setq _size (round __size))
   (setq _size_dest (round __size_dest))
   self)
  (:pointArray
   (&rest __pointArray)
   (if (keywordp (car __pointArray))
       (send* _pointArray __pointArray)
     (progn
       (if __pointArray (setq _pointArray (car __pointArray)))
       _pointArray)))
  (:destArray
   (&rest __destArray)
   (if (keywordp (car __destArray))
       (send* _destArray __destArray)
     (progn
       (if __destArray (setq _destArray (car __destArray)))
       _destArray)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:size_dest
   (&optional __size_dest)
   (if __size_dest (setq _size_dest __size_dest)) _size_dest)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _pointArray
    (apply #'+ (send-all _pointArray :serialization-length)) 4
    ;; geometry_msgs/Point[] _destArray
    (apply #'+ (send-all _destArray :serialization-length)) 4
    ;; bool _type
    1
    ;; int32 _size
    4
    ;; int32 _size_dest
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
     ;; geometry_msgs/Point[] _destArray
     (write-long (length _destArray) s)
     (dolist (elem _destArray)
       (send elem :serialize s)
       )
     ;; bool _type
       (if _type (write-byte -1 s) (write-byte 0 s))
     ;; int32 _size
       (write-long _size s)
     ;; int32 _size_dest
       (write-long _size_dest s)
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
   ;; geometry_msgs/Point[] _destArray
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _destArray (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _destArray)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _type
     (setq _type (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _size_dest
     (setq _size_dest (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get RMPISR::addpoint :md5sum-) "fca49ca1a51aa0c3cdeb5f4e59c200d6")
(setf (get RMPISR::addpoint :datatype-) "RMPISR/addpoint")
(setf (get RMPISR::addpoint :request) RMPISR::addpointRequest)
(setf (get RMPISR::addpoint :response) RMPISR::addpointResponse)

(defmethod RMPISR::addpointRequest
  (:response () (instance RMPISR::addpointResponse :init)))

(setf (get RMPISR::addpointRequest :md5sum-) "fca49ca1a51aa0c3cdeb5f4e59c200d6")
(setf (get RMPISR::addpointRequest :datatype-) "RMPISR/addpointRequest")
(setf (get RMPISR::addpointRequest :definition-)
      "geometry_msgs/Point[] pointArray
geometry_msgs/Point[] destArray
bool type
int32 size
int32 size_dest

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get RMPISR::addpointResponse :md5sum-) "fca49ca1a51aa0c3cdeb5f4e59c200d6")
(setf (get RMPISR::addpointResponse :datatype-) "RMPISR/addpointResponse")
(setf (get RMPISR::addpointResponse :definition-)
      "geometry_msgs/Point[] pointArray
geometry_msgs/Point[] destArray
bool type
int32 size
int32 size_dest

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :RMPISR/addpoint "fca49ca1a51aa0c3cdeb5f4e59c200d6")



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

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass RMPISR::resetrmpRequest
  :super ros::object
  :slots (_pose ))

(defmethod RMPISR::resetrmpRequest
  (:init
   (&key
    ((:pose __pose) (instance std_msgs::Float32MultiArray :init))
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
    ;; std_msgs/Float32MultiArray _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float32MultiArray _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float32MultiArray _pose
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

(setf (get RMPISR::resetrmp :md5sum-) "f759b8f7398989ae2c04da536ffa12af")
(setf (get RMPISR::resetrmp :datatype-) "RMPISR/resetrmp")
(setf (get RMPISR::resetrmp :request) RMPISR::resetrmpRequest)
(setf (get RMPISR::resetrmp :response) RMPISR::resetrmpResponse)

(defmethod RMPISR::resetrmpRequest
  (:response () (instance RMPISR::resetrmpResponse :init)))

(setf (get RMPISR::resetrmpRequest :md5sum-) "f759b8f7398989ae2c04da536ffa12af")
(setf (get RMPISR::resetrmpRequest :datatype-) "RMPISR/resetrmpRequest")
(setf (get RMPISR::resetrmpRequest :definition-)
      "std_msgs/Float32MultiArray pose

================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
")

(setf (get RMPISR::resetrmpResponse :md5sum-) "f759b8f7398989ae2c04da536ffa12af")
(setf (get RMPISR::resetrmpResponse :datatype-) "RMPISR/resetrmpResponse")
(setf (get RMPISR::resetrmpResponse :definition-)
      "std_msgs/Float32MultiArray pose

================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
")



(provide :RMPISR/resetrmp "f759b8f7398989ae2c04da536ffa12af")



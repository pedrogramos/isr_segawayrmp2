; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude resetrmp-request.msg.html

(cl:defclass <resetrmp-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type std_msgs-msg:Float32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Float32MultiArray)))
)

(cl:defclass resetrmp-request (<resetrmp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetrmp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetrmp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<resetrmp-request> is deprecated: use RMPISR-srv:resetrmp-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <resetrmp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:pose-val is deprecated.  Use RMPISR-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetrmp-request>) ostream)
  "Serializes a message object of type '<resetrmp-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetrmp-request>) istream)
  "Deserializes a message object of type '<resetrmp-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetrmp-request>)))
  "Returns string type for a service object of type '<resetrmp-request>"
  "RMPISR/resetrmpRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetrmp-request)))
  "Returns string type for a service object of type 'resetrmp-request"
  "RMPISR/resetrmpRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetrmp-request>)))
  "Returns md5sum for a message object of type '<resetrmp-request>"
  "f759b8f7398989ae2c04da536ffa12af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetrmp-request)))
  "Returns md5sum for a message object of type 'resetrmp-request"
  "f759b8f7398989ae2c04da536ffa12af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetrmp-request>)))
  "Returns full string definition for message of type '<resetrmp-request>"
  (cl:format cl:nil "std_msgs/Float32MultiArray pose~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetrmp-request)))
  "Returns full string definition for message of type 'resetrmp-request"
  (cl:format cl:nil "std_msgs/Float32MultiArray pose~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetrmp-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetrmp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'resetrmp-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude resetrmp-response.msg.html

(cl:defclass <resetrmp-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass resetrmp-response (<resetrmp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetrmp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetrmp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<resetrmp-response> is deprecated: use RMPISR-srv:resetrmp-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetrmp-response>) ostream)
  "Serializes a message object of type '<resetrmp-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetrmp-response>) istream)
  "Deserializes a message object of type '<resetrmp-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetrmp-response>)))
  "Returns string type for a service object of type '<resetrmp-response>"
  "RMPISR/resetrmpResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetrmp-response)))
  "Returns string type for a service object of type 'resetrmp-response"
  "RMPISR/resetrmpResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetrmp-response>)))
  "Returns md5sum for a message object of type '<resetrmp-response>"
  "f759b8f7398989ae2c04da536ffa12af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetrmp-response)))
  "Returns md5sum for a message object of type 'resetrmp-response"
  "f759b8f7398989ae2c04da536ffa12af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetrmp-response>)))
  "Returns full string definition for message of type '<resetrmp-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetrmp-response)))
  "Returns full string definition for message of type 'resetrmp-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetrmp-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetrmp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'resetrmp-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'resetrmp)))
  'resetrmp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'resetrmp)))
  'resetrmp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetrmp)))
  "Returns string type for a service object of type '<resetrmp>"
  "RMPISR/resetrmp")
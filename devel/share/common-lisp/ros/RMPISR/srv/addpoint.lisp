; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude addpoint-request.msg.html

(cl:defclass <addpoint-request> (roslisp-msg-protocol:ros-message)
  ((pointArray
    :reader pointArray
    :initarg :pointArray
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (type
    :reader type
    :initarg :type
    :type cl:boolean
    :initform cl:nil)
   (size
    :reader size
    :initarg :size
    :type cl:fixnum
    :initform 0))
)

(cl:defclass addpoint-request (<addpoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addpoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addpoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<addpoint-request> is deprecated: use RMPISR-srv:addpoint-request instead.")))

(cl:ensure-generic-function 'pointArray-val :lambda-list '(m))
(cl:defmethod pointArray-val ((m <addpoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:pointArray-val is deprecated.  Use RMPISR-srv:pointArray instead.")
  (pointArray m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <addpoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:type-val is deprecated.  Use RMPISR-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <addpoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:size-val is deprecated.  Use RMPISR-srv:size instead.")
  (size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addpoint-request>) ostream)
  "Serializes a message object of type '<addpoint-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pointArray))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pointArray))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'type) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addpoint-request>) istream)
  "Deserializes a message object of type '<addpoint-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pointArray) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pointArray)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'type) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addpoint-request>)))
  "Returns string type for a service object of type '<addpoint-request>"
  "RMPISR/addpointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addpoint-request)))
  "Returns string type for a service object of type 'addpoint-request"
  "RMPISR/addpointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addpoint-request>)))
  "Returns md5sum for a message object of type '<addpoint-request>"
  "77e78fdbf22a409a15b41bafedb3fda3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addpoint-request)))
  "Returns md5sum for a message object of type 'addpoint-request"
  "77e78fdbf22a409a15b41bafedb3fda3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addpoint-request>)))
  "Returns full string definition for message of type '<addpoint-request>"
  (cl:format cl:nil "geometry_msgs/Point[] pointArray~%bool type~%uint8 size~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addpoint-request)))
  "Returns full string definition for message of type 'addpoint-request"
  (cl:format cl:nil "geometry_msgs/Point[] pointArray~%bool type~%uint8 size~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addpoint-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pointArray) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addpoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'addpoint-request
    (cl:cons ':pointArray (pointArray msg))
    (cl:cons ':type (type msg))
    (cl:cons ':size (size msg))
))
;//! \htmlinclude addpoint-response.msg.html

(cl:defclass <addpoint-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass addpoint-response (<addpoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addpoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addpoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<addpoint-response> is deprecated: use RMPISR-srv:addpoint-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addpoint-response>) ostream)
  "Serializes a message object of type '<addpoint-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addpoint-response>) istream)
  "Deserializes a message object of type '<addpoint-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addpoint-response>)))
  "Returns string type for a service object of type '<addpoint-response>"
  "RMPISR/addpointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addpoint-response)))
  "Returns string type for a service object of type 'addpoint-response"
  "RMPISR/addpointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addpoint-response>)))
  "Returns md5sum for a message object of type '<addpoint-response>"
  "77e78fdbf22a409a15b41bafedb3fda3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addpoint-response)))
  "Returns md5sum for a message object of type 'addpoint-response"
  "77e78fdbf22a409a15b41bafedb3fda3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addpoint-response>)))
  "Returns full string definition for message of type '<addpoint-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addpoint-response)))
  "Returns full string definition for message of type 'addpoint-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addpoint-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addpoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'addpoint-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'addpoint)))
  'addpoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'addpoint)))
  'addpoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addpoint)))
  "Returns string type for a service object of type '<addpoint>"
  "RMPISR/addpoint")
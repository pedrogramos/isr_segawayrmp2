; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude stop-request.msg.html

(cl:defclass <stop-request> (roslisp-msg-protocol:ros-message)
  ((size
    :reader size
    :initarg :size
    :type cl:fixnum
    :initform 0)
   (pointArray
    :reader pointArray
    :initarg :pointArray
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass stop-request (<stop-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stop-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stop-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<stop-request> is deprecated: use RMPISR-srv:stop-request instead.")))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <stop-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:size-val is deprecated.  Use RMPISR-srv:size instead.")
  (size m))

(cl:ensure-generic-function 'pointArray-val :lambda-list '(m))
(cl:defmethod pointArray-val ((m <stop-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:pointArray-val is deprecated.  Use RMPISR-srv:pointArray instead.")
  (pointArray m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stop-request>) ostream)
  "Serializes a message object of type '<stop-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pointArray) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stop-request>) istream)
  "Deserializes a message object of type '<stop-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pointArray) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stop-request>)))
  "Returns string type for a service object of type '<stop-request>"
  "RMPISR/stopRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop-request)))
  "Returns string type for a service object of type 'stop-request"
  "RMPISR/stopRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stop-request>)))
  "Returns md5sum for a message object of type '<stop-request>"
  "5bbea48bfb057c91b7a5e97f25876fc2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stop-request)))
  "Returns md5sum for a message object of type 'stop-request"
  "5bbea48bfb057c91b7a5e97f25876fc2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stop-request>)))
  "Returns full string definition for message of type '<stop-request>"
  (cl:format cl:nil "uint8 size~%geometry_msgs/Point pointArray~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stop-request)))
  "Returns full string definition for message of type 'stop-request"
  (cl:format cl:nil "uint8 size~%geometry_msgs/Point pointArray~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stop-request>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pointArray))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stop-request>))
  "Converts a ROS message object to a list"
  (cl:list 'stop-request
    (cl:cons ':size (size msg))
    (cl:cons ':pointArray (pointArray msg))
))
;//! \htmlinclude stop-response.msg.html

(cl:defclass <stop-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass stop-response (<stop-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stop-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stop-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<stop-response> is deprecated: use RMPISR-srv:stop-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stop-response>) ostream)
  "Serializes a message object of type '<stop-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stop-response>) istream)
  "Deserializes a message object of type '<stop-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stop-response>)))
  "Returns string type for a service object of type '<stop-response>"
  "RMPISR/stopResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop-response)))
  "Returns string type for a service object of type 'stop-response"
  "RMPISR/stopResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stop-response>)))
  "Returns md5sum for a message object of type '<stop-response>"
  "5bbea48bfb057c91b7a5e97f25876fc2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stop-response)))
  "Returns md5sum for a message object of type 'stop-response"
  "5bbea48bfb057c91b7a5e97f25876fc2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stop-response>)))
  "Returns full string definition for message of type '<stop-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stop-response)))
  "Returns full string definition for message of type 'stop-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stop-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stop-response>))
  "Converts a ROS message object to a list"
  (cl:list 'stop-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'stop)))
  'stop-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'stop)))
  'stop-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop)))
  "Returns string type for a service object of type '<stop>"
  "RMPISR/stop")
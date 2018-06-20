; Auto-generated. Do not edit!


(cl:in-package perception_pkg-srv)


;//! \htmlinclude add_obstacle-request.msg.html

(cl:defclass <add_obstacle-request> (roslisp-msg-protocol:ros-message)
  ((xobj
    :reader xobj
    :initarg :xobj
    :type cl:float
    :initform 0.0)
   (yobj
    :reader yobj
    :initarg :yobj
    :type cl:float
    :initform 0.0))
)

(cl:defclass add_obstacle-request (<add_obstacle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_obstacle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_obstacle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_pkg-srv:<add_obstacle-request> is deprecated: use perception_pkg-srv:add_obstacle-request instead.")))

(cl:ensure-generic-function 'xobj-val :lambda-list '(m))
(cl:defmethod xobj-val ((m <add_obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_pkg-srv:xobj-val is deprecated.  Use perception_pkg-srv:xobj instead.")
  (xobj m))

(cl:ensure-generic-function 'yobj-val :lambda-list '(m))
(cl:defmethod yobj-val ((m <add_obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_pkg-srv:yobj-val is deprecated.  Use perception_pkg-srv:yobj instead.")
  (yobj m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_obstacle-request>) ostream)
  "Serializes a message object of type '<add_obstacle-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xobj))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yobj))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_obstacle-request>) istream)
  "Deserializes a message object of type '<add_obstacle-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xobj) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yobj) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_obstacle-request>)))
  "Returns string type for a service object of type '<add_obstacle-request>"
  "perception_pkg/add_obstacleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_obstacle-request)))
  "Returns string type for a service object of type 'add_obstacle-request"
  "perception_pkg/add_obstacleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_obstacle-request>)))
  "Returns md5sum for a message object of type '<add_obstacle-request>"
  "f8fb8420bfa4e803c844225154ef8e5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_obstacle-request)))
  "Returns md5sum for a message object of type 'add_obstacle-request"
  "f8fb8420bfa4e803c844225154ef8e5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_obstacle-request>)))
  "Returns full string definition for message of type '<add_obstacle-request>"
  (cl:format cl:nil "float32 xobj~%float32 yobj~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_obstacle-request)))
  "Returns full string definition for message of type 'add_obstacle-request"
  (cl:format cl:nil "float32 xobj~%float32 yobj~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_obstacle-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_obstacle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'add_obstacle-request
    (cl:cons ':xobj (xobj msg))
    (cl:cons ':yobj (yobj msg))
))
;//! \htmlinclude add_obstacle-response.msg.html

(cl:defclass <add_obstacle-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass add_obstacle-response (<add_obstacle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_obstacle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_obstacle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_pkg-srv:<add_obstacle-response> is deprecated: use perception_pkg-srv:add_obstacle-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_obstacle-response>) ostream)
  "Serializes a message object of type '<add_obstacle-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_obstacle-response>) istream)
  "Deserializes a message object of type '<add_obstacle-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_obstacle-response>)))
  "Returns string type for a service object of type '<add_obstacle-response>"
  "perception_pkg/add_obstacleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_obstacle-response)))
  "Returns string type for a service object of type 'add_obstacle-response"
  "perception_pkg/add_obstacleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_obstacle-response>)))
  "Returns md5sum for a message object of type '<add_obstacle-response>"
  "f8fb8420bfa4e803c844225154ef8e5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_obstacle-response)))
  "Returns md5sum for a message object of type 'add_obstacle-response"
  "f8fb8420bfa4e803c844225154ef8e5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_obstacle-response>)))
  "Returns full string definition for message of type '<add_obstacle-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_obstacle-response)))
  "Returns full string definition for message of type 'add_obstacle-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_obstacle-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_obstacle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'add_obstacle-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'add_obstacle)))
  'add_obstacle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'add_obstacle)))
  'add_obstacle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_obstacle)))
  "Returns string type for a service object of type '<add_obstacle>"
  "perception_pkg/add_obstacle")
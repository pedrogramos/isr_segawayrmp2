; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude resetrmp-request.msg.html

(cl:defclass <resetrmp-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
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
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetrmp-request)))
  "Returns md5sum for a message object of type 'resetrmp-request"
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetrmp-request>)))
  "Returns full string definition for message of type '<resetrmp-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetrmp-request)))
  "Returns full string definition for message of type 'resetrmp-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
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
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetrmp-response)))
  "Returns md5sum for a message object of type 'resetrmp-response"
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetrmp-response>)))
  "Returns full string definition for message of type '<resetrmp-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetrmp-response)))
  "Returns full string definition for message of type 'resetrmp-response"
  (cl:format cl:nil "~%~%~%"))
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
; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude odomError-request.msg.html

(cl:defclass <odomError-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass odomError-request (<odomError-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <odomError-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'odomError-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<odomError-request> is deprecated: use RMPISR-srv:odomError-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <odomError-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader RMPISR-srv:pose-val is deprecated.  Use RMPISR-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <odomError-request>) ostream)
  "Serializes a message object of type '<odomError-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <odomError-request>) istream)
  "Deserializes a message object of type '<odomError-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<odomError-request>)))
  "Returns string type for a service object of type '<odomError-request>"
  "RMPISR/odomErrorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'odomError-request)))
  "Returns string type for a service object of type 'odomError-request"
  "RMPISR/odomErrorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<odomError-request>)))
  "Returns md5sum for a message object of type '<odomError-request>"
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'odomError-request)))
  "Returns md5sum for a message object of type 'odomError-request"
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<odomError-request>)))
  "Returns full string definition for message of type '<odomError-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'odomError-request)))
  "Returns full string definition for message of type 'odomError-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <odomError-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <odomError-request>))
  "Converts a ROS message object to a list"
  (cl:list 'odomError-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude odomError-response.msg.html

(cl:defclass <odomError-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass odomError-response (<odomError-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <odomError-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'odomError-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<odomError-response> is deprecated: use RMPISR-srv:odomError-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <odomError-response>) ostream)
  "Serializes a message object of type '<odomError-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <odomError-response>) istream)
  "Deserializes a message object of type '<odomError-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<odomError-response>)))
  "Returns string type for a service object of type '<odomError-response>"
  "RMPISR/odomErrorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'odomError-response)))
  "Returns string type for a service object of type 'odomError-response"
  "RMPISR/odomErrorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<odomError-response>)))
  "Returns md5sum for a message object of type '<odomError-response>"
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'odomError-response)))
  "Returns md5sum for a message object of type 'odomError-response"
  "271cb12677c4cd9bccbc642cd9258d1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<odomError-response>)))
  "Returns full string definition for message of type '<odomError-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'odomError-response)))
  "Returns full string definition for message of type 'odomError-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <odomError-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <odomError-response>))
  "Converts a ROS message object to a list"
  (cl:list 'odomError-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'odomError)))
  'odomError-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'odomError)))
  'odomError-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'odomError)))
  "Returns string type for a service object of type '<odomError>"
  "RMPISR/odomError")
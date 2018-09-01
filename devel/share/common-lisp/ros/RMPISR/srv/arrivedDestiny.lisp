; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude arrivedDestiny-request.msg.html

(cl:defclass <arrivedDestiny-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass arrivedDestiny-request (<arrivedDestiny-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arrivedDestiny-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arrivedDestiny-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<arrivedDestiny-request> is deprecated: use RMPISR-srv:arrivedDestiny-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arrivedDestiny-request>) ostream)
  "Serializes a message object of type '<arrivedDestiny-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arrivedDestiny-request>) istream)
  "Deserializes a message object of type '<arrivedDestiny-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arrivedDestiny-request>)))
  "Returns string type for a service object of type '<arrivedDestiny-request>"
  "RMPISR/arrivedDestinyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arrivedDestiny-request)))
  "Returns string type for a service object of type 'arrivedDestiny-request"
  "RMPISR/arrivedDestinyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arrivedDestiny-request>)))
  "Returns md5sum for a message object of type '<arrivedDestiny-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arrivedDestiny-request)))
  "Returns md5sum for a message object of type 'arrivedDestiny-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arrivedDestiny-request>)))
  "Returns full string definition for message of type '<arrivedDestiny-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arrivedDestiny-request)))
  "Returns full string definition for message of type 'arrivedDestiny-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arrivedDestiny-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arrivedDestiny-request>))
  "Converts a ROS message object to a list"
  (cl:list 'arrivedDestiny-request
))
;//! \htmlinclude arrivedDestiny-response.msg.html

(cl:defclass <arrivedDestiny-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass arrivedDestiny-response (<arrivedDestiny-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arrivedDestiny-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arrivedDestiny-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<arrivedDestiny-response> is deprecated: use RMPISR-srv:arrivedDestiny-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arrivedDestiny-response>) ostream)
  "Serializes a message object of type '<arrivedDestiny-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arrivedDestiny-response>) istream)
  "Deserializes a message object of type '<arrivedDestiny-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arrivedDestiny-response>)))
  "Returns string type for a service object of type '<arrivedDestiny-response>"
  "RMPISR/arrivedDestinyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arrivedDestiny-response)))
  "Returns string type for a service object of type 'arrivedDestiny-response"
  "RMPISR/arrivedDestinyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arrivedDestiny-response>)))
  "Returns md5sum for a message object of type '<arrivedDestiny-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arrivedDestiny-response)))
  "Returns md5sum for a message object of type 'arrivedDestiny-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arrivedDestiny-response>)))
  "Returns full string definition for message of type '<arrivedDestiny-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arrivedDestiny-response)))
  "Returns full string definition for message of type 'arrivedDestiny-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arrivedDestiny-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arrivedDestiny-response>))
  "Converts a ROS message object to a list"
  (cl:list 'arrivedDestiny-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'arrivedDestiny)))
  'arrivedDestiny-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'arrivedDestiny)))
  'arrivedDestiny-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arrivedDestiny)))
  "Returns string type for a service object of type '<arrivedDestiny>"
  "RMPISR/arrivedDestiny")
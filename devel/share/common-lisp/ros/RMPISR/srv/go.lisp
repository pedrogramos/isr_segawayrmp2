; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude go-request.msg.html

(cl:defclass <go-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass go-request (<go-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <go-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'go-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<go-request> is deprecated: use RMPISR-srv:go-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <go-request>) ostream)
  "Serializes a message object of type '<go-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <go-request>) istream)
  "Deserializes a message object of type '<go-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<go-request>)))
  "Returns string type for a service object of type '<go-request>"
  "RMPISR/goRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'go-request)))
  "Returns string type for a service object of type 'go-request"
  "RMPISR/goRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<go-request>)))
  "Returns md5sum for a message object of type '<go-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'go-request)))
  "Returns md5sum for a message object of type 'go-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<go-request>)))
  "Returns full string definition for message of type '<go-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'go-request)))
  "Returns full string definition for message of type 'go-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <go-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <go-request>))
  "Converts a ROS message object to a list"
  (cl:list 'go-request
))
;//! \htmlinclude go-response.msg.html

(cl:defclass <go-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass go-response (<go-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <go-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'go-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<go-response> is deprecated: use RMPISR-srv:go-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <go-response>) ostream)
  "Serializes a message object of type '<go-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <go-response>) istream)
  "Deserializes a message object of type '<go-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<go-response>)))
  "Returns string type for a service object of type '<go-response>"
  "RMPISR/goResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'go-response)))
  "Returns string type for a service object of type 'go-response"
  "RMPISR/goResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<go-response>)))
  "Returns md5sum for a message object of type '<go-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'go-response)))
  "Returns md5sum for a message object of type 'go-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<go-response>)))
  "Returns full string definition for message of type '<go-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'go-response)))
  "Returns full string definition for message of type 'go-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <go-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <go-response>))
  "Converts a ROS message object to a list"
  (cl:list 'go-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'go)))
  'go-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'go)))
  'go-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'go)))
  "Returns string type for a service object of type '<go>"
  "RMPISR/go")
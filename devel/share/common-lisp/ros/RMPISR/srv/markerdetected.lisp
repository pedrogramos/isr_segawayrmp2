; Auto-generated. Do not edit!


(cl:in-package RMPISR-srv)


;//! \htmlinclude markerdetected-request.msg.html

(cl:defclass <markerdetected-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass markerdetected-request (<markerdetected-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <markerdetected-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'markerdetected-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<markerdetected-request> is deprecated: use RMPISR-srv:markerdetected-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <markerdetected-request>) ostream)
  "Serializes a message object of type '<markerdetected-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <markerdetected-request>) istream)
  "Deserializes a message object of type '<markerdetected-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<markerdetected-request>)))
  "Returns string type for a service object of type '<markerdetected-request>"
  "RMPISR/markerdetectedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'markerdetected-request)))
  "Returns string type for a service object of type 'markerdetected-request"
  "RMPISR/markerdetectedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<markerdetected-request>)))
  "Returns md5sum for a message object of type '<markerdetected-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'markerdetected-request)))
  "Returns md5sum for a message object of type 'markerdetected-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<markerdetected-request>)))
  "Returns full string definition for message of type '<markerdetected-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'markerdetected-request)))
  "Returns full string definition for message of type 'markerdetected-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <markerdetected-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <markerdetected-request>))
  "Converts a ROS message object to a list"
  (cl:list 'markerdetected-request
))
;//! \htmlinclude markerdetected-response.msg.html

(cl:defclass <markerdetected-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass markerdetected-response (<markerdetected-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <markerdetected-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'markerdetected-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name RMPISR-srv:<markerdetected-response> is deprecated: use RMPISR-srv:markerdetected-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <markerdetected-response>) ostream)
  "Serializes a message object of type '<markerdetected-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <markerdetected-response>) istream)
  "Deserializes a message object of type '<markerdetected-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<markerdetected-response>)))
  "Returns string type for a service object of type '<markerdetected-response>"
  "RMPISR/markerdetectedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'markerdetected-response)))
  "Returns string type for a service object of type 'markerdetected-response"
  "RMPISR/markerdetectedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<markerdetected-response>)))
  "Returns md5sum for a message object of type '<markerdetected-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'markerdetected-response)))
  "Returns md5sum for a message object of type 'markerdetected-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<markerdetected-response>)))
  "Returns full string definition for message of type '<markerdetected-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'markerdetected-response)))
  "Returns full string definition for message of type 'markerdetected-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <markerdetected-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <markerdetected-response>))
  "Converts a ROS message object to a list"
  (cl:list 'markerdetected-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'markerdetected)))
  'markerdetected-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'markerdetected)))
  'markerdetected-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'markerdetected)))
  "Returns string type for a service object of type '<markerdetected>"
  "RMPISR/markerdetected")
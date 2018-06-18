; Auto-generated. Do not edit!


(cl:in-package rosserial_arduino-msg)


;//! \htmlinclude sensors.msg.html

(cl:defclass <sensors> (roslisp-msg-protocol:ros-message)
  ((ir1
    :reader ir1
    :initarg :ir1
    :type cl:fixnum
    :initform 0)
   (ir2
    :reader ir2
    :initarg :ir2
    :type cl:fixnum
    :initform 0)
   (ir3
    :reader ir3
    :initarg :ir3
    :type cl:fixnum
    :initform 0)
   (ir4
    :reader ir4
    :initarg :ir4
    :type cl:fixnum
    :initform 0)
   (s1
    :reader s1
    :initarg :s1
    :type cl:fixnum
    :initform 0)
   (s2
    :reader s2
    :initarg :s2
    :type cl:fixnum
    :initform 0)
   (s5
    :reader s5
    :initarg :s5
    :type cl:fixnum
    :initform 0))
)

(cl:defclass sensors (<sensors>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sensors>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sensors)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rosserial_arduino-msg:<sensors> is deprecated: use rosserial_arduino-msg:sensors instead.")))

(cl:ensure-generic-function 'ir1-val :lambda-list '(m))
(cl:defmethod ir1-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:ir1-val is deprecated.  Use rosserial_arduino-msg:ir1 instead.")
  (ir1 m))

(cl:ensure-generic-function 'ir2-val :lambda-list '(m))
(cl:defmethod ir2-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:ir2-val is deprecated.  Use rosserial_arduino-msg:ir2 instead.")
  (ir2 m))

(cl:ensure-generic-function 'ir3-val :lambda-list '(m))
(cl:defmethod ir3-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:ir3-val is deprecated.  Use rosserial_arduino-msg:ir3 instead.")
  (ir3 m))

(cl:ensure-generic-function 'ir4-val :lambda-list '(m))
(cl:defmethod ir4-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:ir4-val is deprecated.  Use rosserial_arduino-msg:ir4 instead.")
  (ir4 m))

(cl:ensure-generic-function 's1-val :lambda-list '(m))
(cl:defmethod s1-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:s1-val is deprecated.  Use rosserial_arduino-msg:s1 instead.")
  (s1 m))

(cl:ensure-generic-function 's2-val :lambda-list '(m))
(cl:defmethod s2-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:s2-val is deprecated.  Use rosserial_arduino-msg:s2 instead.")
  (s2 m))

(cl:ensure-generic-function 's5-val :lambda-list '(m))
(cl:defmethod s5-val ((m <sensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:s5-val is deprecated.  Use rosserial_arduino-msg:s5 instead.")
  (s5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sensors>) ostream)
  "Serializes a message object of type '<sensors>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 's1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 's2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 's5)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sensors>) istream)
  "Deserializes a message object of type '<sensors>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ir4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 's1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 's2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 's5)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sensors>)))
  "Returns string type for a message object of type '<sensors>"
  "rosserial_arduino/sensors")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sensors)))
  "Returns string type for a message object of type 'sensors"
  "rosserial_arduino/sensors")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sensors>)))
  "Returns md5sum for a message object of type '<sensors>"
  "9eedb779141fc8e42c127e038f10520e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sensors)))
  "Returns md5sum for a message object of type 'sensors"
  "9eedb779141fc8e42c127e038f10520e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sensors>)))
  "Returns full string definition for message of type '<sensors>"
  (cl:format cl:nil "uint8 ir1~%uint8 ir2~%uint8 ir3~%uint8 ir4~%uint8 s1~%uint8 s2~%uint8 s5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sensors)))
  "Returns full string definition for message of type 'sensors"
  (cl:format cl:nil "uint8 ir1~%uint8 ir2~%uint8 ir3~%uint8 ir4~%uint8 s1~%uint8 s2~%uint8 s5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sensors>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sensors>))
  "Converts a ROS message object to a list"
  (cl:list 'sensors
    (cl:cons ':ir1 (ir1 msg))
    (cl:cons ':ir2 (ir2 msg))
    (cl:cons ':ir3 (ir3 msg))
    (cl:cons ':ir4 (ir4 msg))
    (cl:cons ':s1 (s1 msg))
    (cl:cons ':s2 (s2 msg))
    (cl:cons ':s5 (s5 msg))
))

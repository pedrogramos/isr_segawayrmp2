; Auto-generated. Do not edit!


(cl:in-package segway_rmp-msg)


;//! \htmlinclude SegwayStatusStamped.msg.html

(cl:defclass <SegwayStatusStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (segway
    :reader segway
    :initarg :segway
    :type segway_rmp-msg:SegwayStatus
    :initform (cl:make-instance 'segway_rmp-msg:SegwayStatus)))
)

(cl:defclass SegwayStatusStamped (<SegwayStatusStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegwayStatusStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegwayStatusStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segway_rmp-msg:<SegwayStatusStamped> is deprecated: use segway_rmp-msg:SegwayStatusStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SegwayStatusStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:header-val is deprecated.  Use segway_rmp-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'segway-val :lambda-list '(m))
(cl:defmethod segway-val ((m <SegwayStatusStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:segway-val is deprecated.  Use segway_rmp-msg:segway instead.")
  (segway m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegwayStatusStamped>) ostream)
  "Serializes a message object of type '<SegwayStatusStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'segway) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegwayStatusStamped>) istream)
  "Deserializes a message object of type '<SegwayStatusStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'segway) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegwayStatusStamped>)))
  "Returns string type for a message object of type '<SegwayStatusStamped>"
  "segway_rmp/SegwayStatusStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegwayStatusStamped)))
  "Returns string type for a message object of type 'SegwayStatusStamped"
  "segway_rmp/SegwayStatusStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegwayStatusStamped>)))
  "Returns md5sum for a message object of type '<SegwayStatusStamped>"
  "f11247ac7dcf2a8717603cc53878eec2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegwayStatusStamped)))
  "Returns md5sum for a message object of type 'SegwayStatusStamped"
  "f11247ac7dcf2a8717603cc53878eec2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegwayStatusStamped>)))
  "Returns full string definition for message of type '<SegwayStatusStamped>"
  (cl:format cl:nil "Header       header                      # Timestamp, sequence number, and frame id~%~%SegwayStatus segway                      # Segway Status information~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: segway_rmp/SegwayStatus~%# This is the msg definition for the Segway Status struct.~%~%# Gain Schedule Constants~%int8    LIGHT=1~%int8    TALL=2~%int8    HEAVY=3~%~%# Operation Mode Constants~%int8    BALANCE=1~%int8    TRACTOR=2~%int8    POWER_DOWN=3~%~%float32 pitch_angle                 # radians~%float32 pitch_rate                  # radians/s~%float32 roll_angle                  # radians~%float32 roll_rate                   # radians/s~%float32 left_wheel_velocity         # meters/s~%float32 right_wheel_velocity        # meters/s~%float32 yaw_rate                    # radians/s~%float32 servo_frames                # frames/second~%float32 left_wheel_displacement     # meters~%float32 right_wheel_displacement    # meters~%float32 forward_displacement        # meters~%float32 yaw_displacement            # revolutions~%float32 left_motor_torque           # Newton-meters~%float32 right_motor_torque          # Newton-meters~%int8    operation_mode              # Balance, Tractor, or Powered Down~%int8    gain_schedule               # Light, Tall, or Heavy~%float32 ui_battery                  # Volts~%float32 powerbase_battery           # Volts~%~%bool    motors_enabled              # Enabled (true) or E-Stopped (false)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegwayStatusStamped)))
  "Returns full string definition for message of type 'SegwayStatusStamped"
  (cl:format cl:nil "Header       header                      # Timestamp, sequence number, and frame id~%~%SegwayStatus segway                      # Segway Status information~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: segway_rmp/SegwayStatus~%# This is the msg definition for the Segway Status struct.~%~%# Gain Schedule Constants~%int8    LIGHT=1~%int8    TALL=2~%int8    HEAVY=3~%~%# Operation Mode Constants~%int8    BALANCE=1~%int8    TRACTOR=2~%int8    POWER_DOWN=3~%~%float32 pitch_angle                 # radians~%float32 pitch_rate                  # radians/s~%float32 roll_angle                  # radians~%float32 roll_rate                   # radians/s~%float32 left_wheel_velocity         # meters/s~%float32 right_wheel_velocity        # meters/s~%float32 yaw_rate                    # radians/s~%float32 servo_frames                # frames/second~%float32 left_wheel_displacement     # meters~%float32 right_wheel_displacement    # meters~%float32 forward_displacement        # meters~%float32 yaw_displacement            # revolutions~%float32 left_motor_torque           # Newton-meters~%float32 right_motor_torque          # Newton-meters~%int8    operation_mode              # Balance, Tractor, or Powered Down~%int8    gain_schedule               # Light, Tall, or Heavy~%float32 ui_battery                  # Volts~%float32 powerbase_battery           # Volts~%~%bool    motors_enabled              # Enabled (true) or E-Stopped (false)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegwayStatusStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'segway))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegwayStatusStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'SegwayStatusStamped
    (cl:cons ':header (header msg))
    (cl:cons ':segway (segway msg))
))

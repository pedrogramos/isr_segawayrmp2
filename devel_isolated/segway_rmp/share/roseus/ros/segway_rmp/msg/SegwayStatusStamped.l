;; Auto-generated. Do not edit!


(when (boundp 'segway_rmp::SegwayStatusStamped)
  (if (not (find-package "SEGWAY_RMP"))
    (make-package "SEGWAY_RMP"))
  (shadow 'SegwayStatusStamped (find-package "SEGWAY_RMP")))
(unless (find-package "SEGWAY_RMP::SEGWAYSTATUSSTAMPED")
  (make-package "SEGWAY_RMP::SEGWAYSTATUSSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude SegwayStatusStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass segway_rmp::SegwayStatusStamped
  :super ros::object
  :slots (_header _segway ))

(defmethod segway_rmp::SegwayStatusStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:segway __segway) (instance segway_rmp::SegwayStatus :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _segway __segway)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:segway
   (&rest __segway)
   (if (keywordp (car __segway))
       (send* _segway __segway)
     (progn
       (if __segway (setq _segway (car __segway)))
       _segway)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; segway_rmp/SegwayStatus _segway
    (send _segway :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; segway_rmp/SegwayStatus _segway
       (send _segway :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; segway_rmp/SegwayStatus _segway
     (send _segway :deserialize buf ptr-) (incf ptr- (send _segway :serialization-length))
   ;;
   self)
  )

(setf (get segway_rmp::SegwayStatusStamped :md5sum-) "f11247ac7dcf2a8717603cc53878eec2")
(setf (get segway_rmp::SegwayStatusStamped :datatype-) "segway_rmp/SegwayStatusStamped")
(setf (get segway_rmp::SegwayStatusStamped :definition-)
      "Header       header                      # Timestamp, sequence number, and frame id

SegwayStatus segway                      # Segway Status information
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: segway_rmp/SegwayStatus
# This is the msg definition for the Segway Status struct.

# Gain Schedule Constants
int8    LIGHT=1
int8    TALL=2
int8    HEAVY=3

# Operation Mode Constants
int8    BALANCE=1
int8    TRACTOR=2
int8    POWER_DOWN=3

float32 pitch_angle                 # radians
float32 pitch_rate                  # radians/s
float32 roll_angle                  # radians
float32 roll_rate                   # radians/s
float32 left_wheel_velocity         # meters/s
float32 right_wheel_velocity        # meters/s
float32 yaw_rate                    # radians/s
float32 servo_frames                # frames/second
float32 left_wheel_displacement     # meters
float32 right_wheel_displacement    # meters
float32 forward_displacement        # meters
float32 yaw_displacement            # revolutions
float32 left_motor_torque           # Newton-meters
float32 right_motor_torque          # Newton-meters
int8    operation_mode              # Balance, Tractor, or Powered Down
int8    gain_schedule               # Light, Tall, or Heavy
float32 ui_battery                  # Volts
float32 powerbase_battery           # Volts

bool    motors_enabled              # Enabled (true) or E-Stopped (false)

")



(provide :segway_rmp/SegwayStatusStamped "f11247ac7dcf2a8717603cc53878eec2")



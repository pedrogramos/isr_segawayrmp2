;; Auto-generated. Do not edit!


(when (boundp 'segway_rmp::SegwayStatus)
  (if (not (find-package "SEGWAY_RMP"))
    (make-package "SEGWAY_RMP"))
  (shadow 'SegwayStatus (find-package "SEGWAY_RMP")))
(unless (find-package "SEGWAY_RMP::SEGWAYSTATUS")
  (make-package "SEGWAY_RMP::SEGWAYSTATUS"))

(in-package "ROS")
;;//! \htmlinclude SegwayStatus.msg.html


(intern "*LIGHT*" (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(shadow '*LIGHT* (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(defconstant segway_rmp::SegwayStatus::*LIGHT* 1)
(intern "*TALL*" (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(shadow '*TALL* (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(defconstant segway_rmp::SegwayStatus::*TALL* 2)
(intern "*HEAVY*" (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(shadow '*HEAVY* (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(defconstant segway_rmp::SegwayStatus::*HEAVY* 3)
(intern "*BALANCE*" (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(shadow '*BALANCE* (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(defconstant segway_rmp::SegwayStatus::*BALANCE* 1)
(intern "*TRACTOR*" (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(shadow '*TRACTOR* (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(defconstant segway_rmp::SegwayStatus::*TRACTOR* 2)
(intern "*POWER_DOWN*" (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(shadow '*POWER_DOWN* (find-package "SEGWAY_RMP::SEGWAYSTATUS"))
(defconstant segway_rmp::SegwayStatus::*POWER_DOWN* 3)
(defclass segway_rmp::SegwayStatus
  :super ros::object
  :slots (_pitch_angle _pitch_rate _roll_angle _roll_rate _left_wheel_velocity _right_wheel_velocity _yaw_rate _servo_frames _left_wheel_displacement _right_wheel_displacement _forward_displacement _yaw_displacement _left_motor_torque _right_motor_torque _operation_mode _gain_schedule _ui_battery _powerbase_battery _motors_enabled ))

(defmethod segway_rmp::SegwayStatus
  (:init
   (&key
    ((:pitch_angle __pitch_angle) 0.0)
    ((:pitch_rate __pitch_rate) 0.0)
    ((:roll_angle __roll_angle) 0.0)
    ((:roll_rate __roll_rate) 0.0)
    ((:left_wheel_velocity __left_wheel_velocity) 0.0)
    ((:right_wheel_velocity __right_wheel_velocity) 0.0)
    ((:yaw_rate __yaw_rate) 0.0)
    ((:servo_frames __servo_frames) 0.0)
    ((:left_wheel_displacement __left_wheel_displacement) 0.0)
    ((:right_wheel_displacement __right_wheel_displacement) 0.0)
    ((:forward_displacement __forward_displacement) 0.0)
    ((:yaw_displacement __yaw_displacement) 0.0)
    ((:left_motor_torque __left_motor_torque) 0.0)
    ((:right_motor_torque __right_motor_torque) 0.0)
    ((:operation_mode __operation_mode) 0)
    ((:gain_schedule __gain_schedule) 0)
    ((:ui_battery __ui_battery) 0.0)
    ((:powerbase_battery __powerbase_battery) 0.0)
    ((:motors_enabled __motors_enabled) nil)
    )
   (send-super :init)
   (setq _pitch_angle (float __pitch_angle))
   (setq _pitch_rate (float __pitch_rate))
   (setq _roll_angle (float __roll_angle))
   (setq _roll_rate (float __roll_rate))
   (setq _left_wheel_velocity (float __left_wheel_velocity))
   (setq _right_wheel_velocity (float __right_wheel_velocity))
   (setq _yaw_rate (float __yaw_rate))
   (setq _servo_frames (float __servo_frames))
   (setq _left_wheel_displacement (float __left_wheel_displacement))
   (setq _right_wheel_displacement (float __right_wheel_displacement))
   (setq _forward_displacement (float __forward_displacement))
   (setq _yaw_displacement (float __yaw_displacement))
   (setq _left_motor_torque (float __left_motor_torque))
   (setq _right_motor_torque (float __right_motor_torque))
   (setq _operation_mode (round __operation_mode))
   (setq _gain_schedule (round __gain_schedule))
   (setq _ui_battery (float __ui_battery))
   (setq _powerbase_battery (float __powerbase_battery))
   (setq _motors_enabled __motors_enabled)
   self)
  (:pitch_angle
   (&optional __pitch_angle)
   (if __pitch_angle (setq _pitch_angle __pitch_angle)) _pitch_angle)
  (:pitch_rate
   (&optional __pitch_rate)
   (if __pitch_rate (setq _pitch_rate __pitch_rate)) _pitch_rate)
  (:roll_angle
   (&optional __roll_angle)
   (if __roll_angle (setq _roll_angle __roll_angle)) _roll_angle)
  (:roll_rate
   (&optional __roll_rate)
   (if __roll_rate (setq _roll_rate __roll_rate)) _roll_rate)
  (:left_wheel_velocity
   (&optional __left_wheel_velocity)
   (if __left_wheel_velocity (setq _left_wheel_velocity __left_wheel_velocity)) _left_wheel_velocity)
  (:right_wheel_velocity
   (&optional __right_wheel_velocity)
   (if __right_wheel_velocity (setq _right_wheel_velocity __right_wheel_velocity)) _right_wheel_velocity)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:servo_frames
   (&optional __servo_frames)
   (if __servo_frames (setq _servo_frames __servo_frames)) _servo_frames)
  (:left_wheel_displacement
   (&optional __left_wheel_displacement)
   (if __left_wheel_displacement (setq _left_wheel_displacement __left_wheel_displacement)) _left_wheel_displacement)
  (:right_wheel_displacement
   (&optional __right_wheel_displacement)
   (if __right_wheel_displacement (setq _right_wheel_displacement __right_wheel_displacement)) _right_wheel_displacement)
  (:forward_displacement
   (&optional __forward_displacement)
   (if __forward_displacement (setq _forward_displacement __forward_displacement)) _forward_displacement)
  (:yaw_displacement
   (&optional __yaw_displacement)
   (if __yaw_displacement (setq _yaw_displacement __yaw_displacement)) _yaw_displacement)
  (:left_motor_torque
   (&optional __left_motor_torque)
   (if __left_motor_torque (setq _left_motor_torque __left_motor_torque)) _left_motor_torque)
  (:right_motor_torque
   (&optional __right_motor_torque)
   (if __right_motor_torque (setq _right_motor_torque __right_motor_torque)) _right_motor_torque)
  (:operation_mode
   (&optional __operation_mode)
   (if __operation_mode (setq _operation_mode __operation_mode)) _operation_mode)
  (:gain_schedule
   (&optional __gain_schedule)
   (if __gain_schedule (setq _gain_schedule __gain_schedule)) _gain_schedule)
  (:ui_battery
   (&optional __ui_battery)
   (if __ui_battery (setq _ui_battery __ui_battery)) _ui_battery)
  (:powerbase_battery
   (&optional __powerbase_battery)
   (if __powerbase_battery (setq _powerbase_battery __powerbase_battery)) _powerbase_battery)
  (:motors_enabled
   (&optional __motors_enabled)
   (if __motors_enabled (setq _motors_enabled __motors_enabled)) _motors_enabled)
  (:serialization-length
   ()
   (+
    ;; float32 _pitch_angle
    4
    ;; float32 _pitch_rate
    4
    ;; float32 _roll_angle
    4
    ;; float32 _roll_rate
    4
    ;; float32 _left_wheel_velocity
    4
    ;; float32 _right_wheel_velocity
    4
    ;; float32 _yaw_rate
    4
    ;; float32 _servo_frames
    4
    ;; float32 _left_wheel_displacement
    4
    ;; float32 _right_wheel_displacement
    4
    ;; float32 _forward_displacement
    4
    ;; float32 _yaw_displacement
    4
    ;; float32 _left_motor_torque
    4
    ;; float32 _right_motor_torque
    4
    ;; int8 _operation_mode
    1
    ;; int8 _gain_schedule
    1
    ;; float32 _ui_battery
    4
    ;; float32 _powerbase_battery
    4
    ;; bool _motors_enabled
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pitch_angle
       (sys::poke _pitch_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch_rate
       (sys::poke _pitch_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll_angle
       (sys::poke _roll_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll_rate
       (sys::poke _roll_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_wheel_velocity
       (sys::poke _left_wheel_velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_wheel_velocity
       (sys::poke _right_wheel_velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _servo_frames
       (sys::poke _servo_frames (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_wheel_displacement
       (sys::poke _left_wheel_displacement (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_wheel_displacement
       (sys::poke _right_wheel_displacement (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _forward_displacement
       (sys::poke _forward_displacement (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_displacement
       (sys::poke _yaw_displacement (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_motor_torque
       (sys::poke _left_motor_torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_motor_torque
       (sys::poke _right_motor_torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _operation_mode
       (write-byte _operation_mode s)
     ;; int8 _gain_schedule
       (write-byte _gain_schedule s)
     ;; float32 _ui_battery
       (sys::poke _ui_battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _powerbase_battery
       (sys::poke _powerbase_battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _motors_enabled
       (if _motors_enabled (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pitch_angle
     (setq _pitch_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch_rate
     (setq _pitch_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll_angle
     (setq _roll_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll_rate
     (setq _roll_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_wheel_velocity
     (setq _left_wheel_velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_wheel_velocity
     (setq _right_wheel_velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _servo_frames
     (setq _servo_frames (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_wheel_displacement
     (setq _left_wheel_displacement (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_wheel_displacement
     (setq _right_wheel_displacement (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _forward_displacement
     (setq _forward_displacement (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_displacement
     (setq _yaw_displacement (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_motor_torque
     (setq _left_motor_torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_motor_torque
     (setq _right_motor_torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _operation_mode
     (setq _operation_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _operation_mode 127) (setq _operation_mode (- _operation_mode 256)))
   ;; int8 _gain_schedule
     (setq _gain_schedule (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _gain_schedule 127) (setq _gain_schedule (- _gain_schedule 256)))
   ;; float32 _ui_battery
     (setq _ui_battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _powerbase_battery
     (setq _powerbase_battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _motors_enabled
     (setq _motors_enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get segway_rmp::SegwayStatus :md5sum-) "658b68a87a84c7483fa3f522de0a2f66")
(setf (get segway_rmp::SegwayStatus :datatype-) "segway_rmp/SegwayStatus")
(setf (get segway_rmp::SegwayStatus :definition-)
      "# This is the msg definition for the Segway Status struct.

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



(provide :segway_rmp/SegwayStatus "658b68a87a84c7483fa3f522de0a2f66")



; Auto-generated. Do not edit!


(cl:in-package segway_rmp-msg)


;//! \htmlinclude SegwayStatus.msg.html

(cl:defclass <SegwayStatus> (roslisp-msg-protocol:ros-message)
  ((pitch_angle
    :reader pitch_angle
    :initarg :pitch_angle
    :type cl:float
    :initform 0.0)
   (pitch_rate
    :reader pitch_rate
    :initarg :pitch_rate
    :type cl:float
    :initform 0.0)
   (roll_angle
    :reader roll_angle
    :initarg :roll_angle
    :type cl:float
    :initform 0.0)
   (roll_rate
    :reader roll_rate
    :initarg :roll_rate
    :type cl:float
    :initform 0.0)
   (left_wheel_velocity
    :reader left_wheel_velocity
    :initarg :left_wheel_velocity
    :type cl:float
    :initform 0.0)
   (right_wheel_velocity
    :reader right_wheel_velocity
    :initarg :right_wheel_velocity
    :type cl:float
    :initform 0.0)
   (yaw_rate
    :reader yaw_rate
    :initarg :yaw_rate
    :type cl:float
    :initform 0.0)
   (servo_frames
    :reader servo_frames
    :initarg :servo_frames
    :type cl:float
    :initform 0.0)
   (left_wheel_displacement
    :reader left_wheel_displacement
    :initarg :left_wheel_displacement
    :type cl:float
    :initform 0.0)
   (right_wheel_displacement
    :reader right_wheel_displacement
    :initarg :right_wheel_displacement
    :type cl:float
    :initform 0.0)
   (forward_displacement
    :reader forward_displacement
    :initarg :forward_displacement
    :type cl:float
    :initform 0.0)
   (yaw_displacement
    :reader yaw_displacement
    :initarg :yaw_displacement
    :type cl:float
    :initform 0.0)
   (left_motor_torque
    :reader left_motor_torque
    :initarg :left_motor_torque
    :type cl:float
    :initform 0.0)
   (right_motor_torque
    :reader right_motor_torque
    :initarg :right_motor_torque
    :type cl:float
    :initform 0.0)
   (operation_mode
    :reader operation_mode
    :initarg :operation_mode
    :type cl:fixnum
    :initform 0)
   (gain_schedule
    :reader gain_schedule
    :initarg :gain_schedule
    :type cl:fixnum
    :initform 0)
   (ui_battery
    :reader ui_battery
    :initarg :ui_battery
    :type cl:float
    :initform 0.0)
   (powerbase_battery
    :reader powerbase_battery
    :initarg :powerbase_battery
    :type cl:float
    :initform 0.0)
   (motors_enabled
    :reader motors_enabled
    :initarg :motors_enabled
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SegwayStatus (<SegwayStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegwayStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegwayStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segway_rmp-msg:<SegwayStatus> is deprecated: use segway_rmp-msg:SegwayStatus instead.")))

(cl:ensure-generic-function 'pitch_angle-val :lambda-list '(m))
(cl:defmethod pitch_angle-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:pitch_angle-val is deprecated.  Use segway_rmp-msg:pitch_angle instead.")
  (pitch_angle m))

(cl:ensure-generic-function 'pitch_rate-val :lambda-list '(m))
(cl:defmethod pitch_rate-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:pitch_rate-val is deprecated.  Use segway_rmp-msg:pitch_rate instead.")
  (pitch_rate m))

(cl:ensure-generic-function 'roll_angle-val :lambda-list '(m))
(cl:defmethod roll_angle-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:roll_angle-val is deprecated.  Use segway_rmp-msg:roll_angle instead.")
  (roll_angle m))

(cl:ensure-generic-function 'roll_rate-val :lambda-list '(m))
(cl:defmethod roll_rate-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:roll_rate-val is deprecated.  Use segway_rmp-msg:roll_rate instead.")
  (roll_rate m))

(cl:ensure-generic-function 'left_wheel_velocity-val :lambda-list '(m))
(cl:defmethod left_wheel_velocity-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:left_wheel_velocity-val is deprecated.  Use segway_rmp-msg:left_wheel_velocity instead.")
  (left_wheel_velocity m))

(cl:ensure-generic-function 'right_wheel_velocity-val :lambda-list '(m))
(cl:defmethod right_wheel_velocity-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:right_wheel_velocity-val is deprecated.  Use segway_rmp-msg:right_wheel_velocity instead.")
  (right_wheel_velocity m))

(cl:ensure-generic-function 'yaw_rate-val :lambda-list '(m))
(cl:defmethod yaw_rate-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:yaw_rate-val is deprecated.  Use segway_rmp-msg:yaw_rate instead.")
  (yaw_rate m))

(cl:ensure-generic-function 'servo_frames-val :lambda-list '(m))
(cl:defmethod servo_frames-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:servo_frames-val is deprecated.  Use segway_rmp-msg:servo_frames instead.")
  (servo_frames m))

(cl:ensure-generic-function 'left_wheel_displacement-val :lambda-list '(m))
(cl:defmethod left_wheel_displacement-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:left_wheel_displacement-val is deprecated.  Use segway_rmp-msg:left_wheel_displacement instead.")
  (left_wheel_displacement m))

(cl:ensure-generic-function 'right_wheel_displacement-val :lambda-list '(m))
(cl:defmethod right_wheel_displacement-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:right_wheel_displacement-val is deprecated.  Use segway_rmp-msg:right_wheel_displacement instead.")
  (right_wheel_displacement m))

(cl:ensure-generic-function 'forward_displacement-val :lambda-list '(m))
(cl:defmethod forward_displacement-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:forward_displacement-val is deprecated.  Use segway_rmp-msg:forward_displacement instead.")
  (forward_displacement m))

(cl:ensure-generic-function 'yaw_displacement-val :lambda-list '(m))
(cl:defmethod yaw_displacement-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:yaw_displacement-val is deprecated.  Use segway_rmp-msg:yaw_displacement instead.")
  (yaw_displacement m))

(cl:ensure-generic-function 'left_motor_torque-val :lambda-list '(m))
(cl:defmethod left_motor_torque-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:left_motor_torque-val is deprecated.  Use segway_rmp-msg:left_motor_torque instead.")
  (left_motor_torque m))

(cl:ensure-generic-function 'right_motor_torque-val :lambda-list '(m))
(cl:defmethod right_motor_torque-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:right_motor_torque-val is deprecated.  Use segway_rmp-msg:right_motor_torque instead.")
  (right_motor_torque m))

(cl:ensure-generic-function 'operation_mode-val :lambda-list '(m))
(cl:defmethod operation_mode-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:operation_mode-val is deprecated.  Use segway_rmp-msg:operation_mode instead.")
  (operation_mode m))

(cl:ensure-generic-function 'gain_schedule-val :lambda-list '(m))
(cl:defmethod gain_schedule-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:gain_schedule-val is deprecated.  Use segway_rmp-msg:gain_schedule instead.")
  (gain_schedule m))

(cl:ensure-generic-function 'ui_battery-val :lambda-list '(m))
(cl:defmethod ui_battery-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:ui_battery-val is deprecated.  Use segway_rmp-msg:ui_battery instead.")
  (ui_battery m))

(cl:ensure-generic-function 'powerbase_battery-val :lambda-list '(m))
(cl:defmethod powerbase_battery-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:powerbase_battery-val is deprecated.  Use segway_rmp-msg:powerbase_battery instead.")
  (powerbase_battery m))

(cl:ensure-generic-function 'motors_enabled-val :lambda-list '(m))
(cl:defmethod motors_enabled-val ((m <SegwayStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segway_rmp-msg:motors_enabled-val is deprecated.  Use segway_rmp-msg:motors_enabled instead.")
  (motors_enabled m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SegwayStatus>)))
    "Constants for message type '<SegwayStatus>"
  '((:LIGHT . 1)
    (:TALL . 2)
    (:HEAVY . 3)
    (:BALANCE . 1)
    (:TRACTOR . 2)
    (:POWER_DOWN . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SegwayStatus)))
    "Constants for message type 'SegwayStatus"
  '((:LIGHT . 1)
    (:TALL . 2)
    (:HEAVY . 3)
    (:BALANCE . 1)
    (:TRACTOR . 2)
    (:POWER_DOWN . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegwayStatus>) ostream)
  "Serializes a message object of type '<SegwayStatus>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_wheel_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_wheel_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'servo_frames))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_wheel_displacement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_wheel_displacement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'forward_displacement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_displacement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_motor_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_motor_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'operation_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gain_schedule)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ui_battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'powerbase_battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'motors_enabled) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegwayStatus>) istream)
  "Deserializes a message object of type '<SegwayStatus>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_wheel_velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_wheel_velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'servo_frames) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_wheel_displacement) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_wheel_displacement) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'forward_displacement) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_displacement) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_motor_torque) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_motor_torque) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'operation_mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gain_schedule) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ui_battery) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'powerbase_battery) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'motors_enabled) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegwayStatus>)))
  "Returns string type for a message object of type '<SegwayStatus>"
  "segway_rmp/SegwayStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegwayStatus)))
  "Returns string type for a message object of type 'SegwayStatus"
  "segway_rmp/SegwayStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegwayStatus>)))
  "Returns md5sum for a message object of type '<SegwayStatus>"
  "658b68a87a84c7483fa3f522de0a2f66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegwayStatus)))
  "Returns md5sum for a message object of type 'SegwayStatus"
  "658b68a87a84c7483fa3f522de0a2f66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegwayStatus>)))
  "Returns full string definition for message of type '<SegwayStatus>"
  (cl:format cl:nil "# This is the msg definition for the Segway Status struct.~%~%# Gain Schedule Constants~%int8    LIGHT=1~%int8    TALL=2~%int8    HEAVY=3~%~%# Operation Mode Constants~%int8    BALANCE=1~%int8    TRACTOR=2~%int8    POWER_DOWN=3~%~%float32 pitch_angle                 # radians~%float32 pitch_rate                  # radians/s~%float32 roll_angle                  # radians~%float32 roll_rate                   # radians/s~%float32 left_wheel_velocity         # meters/s~%float32 right_wheel_velocity        # meters/s~%float32 yaw_rate                    # radians/s~%float32 servo_frames                # frames/second~%float32 left_wheel_displacement     # meters~%float32 right_wheel_displacement    # meters~%float32 forward_displacement        # meters~%float32 yaw_displacement            # revolutions~%float32 left_motor_torque           # Newton-meters~%float32 right_motor_torque          # Newton-meters~%int8    operation_mode              # Balance, Tractor, or Powered Down~%int8    gain_schedule               # Light, Tall, or Heavy~%float32 ui_battery                  # Volts~%float32 powerbase_battery           # Volts~%~%bool    motors_enabled              # Enabled (true) or E-Stopped (false)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegwayStatus)))
  "Returns full string definition for message of type 'SegwayStatus"
  (cl:format cl:nil "# This is the msg definition for the Segway Status struct.~%~%# Gain Schedule Constants~%int8    LIGHT=1~%int8    TALL=2~%int8    HEAVY=3~%~%# Operation Mode Constants~%int8    BALANCE=1~%int8    TRACTOR=2~%int8    POWER_DOWN=3~%~%float32 pitch_angle                 # radians~%float32 pitch_rate                  # radians/s~%float32 roll_angle                  # radians~%float32 roll_rate                   # radians/s~%float32 left_wheel_velocity         # meters/s~%float32 right_wheel_velocity        # meters/s~%float32 yaw_rate                    # radians/s~%float32 servo_frames                # frames/second~%float32 left_wheel_displacement     # meters~%float32 right_wheel_displacement    # meters~%float32 forward_displacement        # meters~%float32 yaw_displacement            # revolutions~%float32 left_motor_torque           # Newton-meters~%float32 right_motor_torque          # Newton-meters~%int8    operation_mode              # Balance, Tractor, or Powered Down~%int8    gain_schedule               # Light, Tall, or Heavy~%float32 ui_battery                  # Volts~%float32 powerbase_battery           # Volts~%~%bool    motors_enabled              # Enabled (true) or E-Stopped (false)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegwayStatus>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     1
     1
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegwayStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'SegwayStatus
    (cl:cons ':pitch_angle (pitch_angle msg))
    (cl:cons ':pitch_rate (pitch_rate msg))
    (cl:cons ':roll_angle (roll_angle msg))
    (cl:cons ':roll_rate (roll_rate msg))
    (cl:cons ':left_wheel_velocity (left_wheel_velocity msg))
    (cl:cons ':right_wheel_velocity (right_wheel_velocity msg))
    (cl:cons ':yaw_rate (yaw_rate msg))
    (cl:cons ':servo_frames (servo_frames msg))
    (cl:cons ':left_wheel_displacement (left_wheel_displacement msg))
    (cl:cons ':right_wheel_displacement (right_wheel_displacement msg))
    (cl:cons ':forward_displacement (forward_displacement msg))
    (cl:cons ':yaw_displacement (yaw_displacement msg))
    (cl:cons ':left_motor_torque (left_motor_torque msg))
    (cl:cons ':right_motor_torque (right_motor_torque msg))
    (cl:cons ':operation_mode (operation_mode msg))
    (cl:cons ':gain_schedule (gain_schedule msg))
    (cl:cons ':ui_battery (ui_battery msg))
    (cl:cons ':powerbase_battery (powerbase_battery msg))
    (cl:cons ':motors_enabled (motors_enabled msg))
))

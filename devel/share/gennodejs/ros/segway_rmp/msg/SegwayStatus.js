// Auto-generated. Do not edit!

// (in-package segway_rmp.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class SegwayStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pitch_angle = null;
      this.pitch_rate = null;
      this.roll_angle = null;
      this.roll_rate = null;
      this.left_wheel_velocity = null;
      this.right_wheel_velocity = null;
      this.yaw_rate = null;
      this.servo_frames = null;
      this.left_wheel_displacement = null;
      this.right_wheel_displacement = null;
      this.forward_displacement = null;
      this.yaw_displacement = null;
      this.left_motor_torque = null;
      this.right_motor_torque = null;
      this.operation_mode = null;
      this.gain_schedule = null;
      this.ui_battery = null;
      this.powerbase_battery = null;
      this.motors_enabled = null;
    }
    else {
      if (initObj.hasOwnProperty('pitch_angle')) {
        this.pitch_angle = initObj.pitch_angle
      }
      else {
        this.pitch_angle = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_rate')) {
        this.pitch_rate = initObj.pitch_rate
      }
      else {
        this.pitch_rate = 0.0;
      }
      if (initObj.hasOwnProperty('roll_angle')) {
        this.roll_angle = initObj.roll_angle
      }
      else {
        this.roll_angle = 0.0;
      }
      if (initObj.hasOwnProperty('roll_rate')) {
        this.roll_rate = initObj.roll_rate
      }
      else {
        this.roll_rate = 0.0;
      }
      if (initObj.hasOwnProperty('left_wheel_velocity')) {
        this.left_wheel_velocity = initObj.left_wheel_velocity
      }
      else {
        this.left_wheel_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('right_wheel_velocity')) {
        this.right_wheel_velocity = initObj.right_wheel_velocity
      }
      else {
        this.right_wheel_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_rate')) {
        this.yaw_rate = initObj.yaw_rate
      }
      else {
        this.yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('servo_frames')) {
        this.servo_frames = initObj.servo_frames
      }
      else {
        this.servo_frames = 0.0;
      }
      if (initObj.hasOwnProperty('left_wheel_displacement')) {
        this.left_wheel_displacement = initObj.left_wheel_displacement
      }
      else {
        this.left_wheel_displacement = 0.0;
      }
      if (initObj.hasOwnProperty('right_wheel_displacement')) {
        this.right_wheel_displacement = initObj.right_wheel_displacement
      }
      else {
        this.right_wheel_displacement = 0.0;
      }
      if (initObj.hasOwnProperty('forward_displacement')) {
        this.forward_displacement = initObj.forward_displacement
      }
      else {
        this.forward_displacement = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_displacement')) {
        this.yaw_displacement = initObj.yaw_displacement
      }
      else {
        this.yaw_displacement = 0.0;
      }
      if (initObj.hasOwnProperty('left_motor_torque')) {
        this.left_motor_torque = initObj.left_motor_torque
      }
      else {
        this.left_motor_torque = 0.0;
      }
      if (initObj.hasOwnProperty('right_motor_torque')) {
        this.right_motor_torque = initObj.right_motor_torque
      }
      else {
        this.right_motor_torque = 0.0;
      }
      if (initObj.hasOwnProperty('operation_mode')) {
        this.operation_mode = initObj.operation_mode
      }
      else {
        this.operation_mode = 0;
      }
      if (initObj.hasOwnProperty('gain_schedule')) {
        this.gain_schedule = initObj.gain_schedule
      }
      else {
        this.gain_schedule = 0;
      }
      if (initObj.hasOwnProperty('ui_battery')) {
        this.ui_battery = initObj.ui_battery
      }
      else {
        this.ui_battery = 0.0;
      }
      if (initObj.hasOwnProperty('powerbase_battery')) {
        this.powerbase_battery = initObj.powerbase_battery
      }
      else {
        this.powerbase_battery = 0.0;
      }
      if (initObj.hasOwnProperty('motors_enabled')) {
        this.motors_enabled = initObj.motors_enabled
      }
      else {
        this.motors_enabled = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SegwayStatus
    // Serialize message field [pitch_angle]
    bufferOffset = _serializer.float32(obj.pitch_angle, buffer, bufferOffset);
    // Serialize message field [pitch_rate]
    bufferOffset = _serializer.float32(obj.pitch_rate, buffer, bufferOffset);
    // Serialize message field [roll_angle]
    bufferOffset = _serializer.float32(obj.roll_angle, buffer, bufferOffset);
    // Serialize message field [roll_rate]
    bufferOffset = _serializer.float32(obj.roll_rate, buffer, bufferOffset);
    // Serialize message field [left_wheel_velocity]
    bufferOffset = _serializer.float32(obj.left_wheel_velocity, buffer, bufferOffset);
    // Serialize message field [right_wheel_velocity]
    bufferOffset = _serializer.float32(obj.right_wheel_velocity, buffer, bufferOffset);
    // Serialize message field [yaw_rate]
    bufferOffset = _serializer.float32(obj.yaw_rate, buffer, bufferOffset);
    // Serialize message field [servo_frames]
    bufferOffset = _serializer.float32(obj.servo_frames, buffer, bufferOffset);
    // Serialize message field [left_wheel_displacement]
    bufferOffset = _serializer.float32(obj.left_wheel_displacement, buffer, bufferOffset);
    // Serialize message field [right_wheel_displacement]
    bufferOffset = _serializer.float32(obj.right_wheel_displacement, buffer, bufferOffset);
    // Serialize message field [forward_displacement]
    bufferOffset = _serializer.float32(obj.forward_displacement, buffer, bufferOffset);
    // Serialize message field [yaw_displacement]
    bufferOffset = _serializer.float32(obj.yaw_displacement, buffer, bufferOffset);
    // Serialize message field [left_motor_torque]
    bufferOffset = _serializer.float32(obj.left_motor_torque, buffer, bufferOffset);
    // Serialize message field [right_motor_torque]
    bufferOffset = _serializer.float32(obj.right_motor_torque, buffer, bufferOffset);
    // Serialize message field [operation_mode]
    bufferOffset = _serializer.int8(obj.operation_mode, buffer, bufferOffset);
    // Serialize message field [gain_schedule]
    bufferOffset = _serializer.int8(obj.gain_schedule, buffer, bufferOffset);
    // Serialize message field [ui_battery]
    bufferOffset = _serializer.float32(obj.ui_battery, buffer, bufferOffset);
    // Serialize message field [powerbase_battery]
    bufferOffset = _serializer.float32(obj.powerbase_battery, buffer, bufferOffset);
    // Serialize message field [motors_enabled]
    bufferOffset = _serializer.bool(obj.motors_enabled, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SegwayStatus
    let len;
    let data = new SegwayStatus(null);
    // Deserialize message field [pitch_angle]
    data.pitch_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch_rate]
    data.pitch_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll_angle]
    data.roll_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll_rate]
    data.roll_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_wheel_velocity]
    data.left_wheel_velocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_wheel_velocity]
    data.right_wheel_velocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_rate]
    data.yaw_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [servo_frames]
    data.servo_frames = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_wheel_displacement]
    data.left_wheel_displacement = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_wheel_displacement]
    data.right_wheel_displacement = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [forward_displacement]
    data.forward_displacement = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_displacement]
    data.yaw_displacement = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_motor_torque]
    data.left_motor_torque = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_motor_torque]
    data.right_motor_torque = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [operation_mode]
    data.operation_mode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [gain_schedule]
    data.gain_schedule = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [ui_battery]
    data.ui_battery = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [powerbase_battery]
    data.powerbase_battery = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motors_enabled]
    data.motors_enabled = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 67;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segway_rmp/SegwayStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '658b68a87a84c7483fa3f522de0a2f66';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SegwayStatus(null);
    if (msg.pitch_angle !== undefined) {
      resolved.pitch_angle = msg.pitch_angle;
    }
    else {
      resolved.pitch_angle = 0.0
    }

    if (msg.pitch_rate !== undefined) {
      resolved.pitch_rate = msg.pitch_rate;
    }
    else {
      resolved.pitch_rate = 0.0
    }

    if (msg.roll_angle !== undefined) {
      resolved.roll_angle = msg.roll_angle;
    }
    else {
      resolved.roll_angle = 0.0
    }

    if (msg.roll_rate !== undefined) {
      resolved.roll_rate = msg.roll_rate;
    }
    else {
      resolved.roll_rate = 0.0
    }

    if (msg.left_wheel_velocity !== undefined) {
      resolved.left_wheel_velocity = msg.left_wheel_velocity;
    }
    else {
      resolved.left_wheel_velocity = 0.0
    }

    if (msg.right_wheel_velocity !== undefined) {
      resolved.right_wheel_velocity = msg.right_wheel_velocity;
    }
    else {
      resolved.right_wheel_velocity = 0.0
    }

    if (msg.yaw_rate !== undefined) {
      resolved.yaw_rate = msg.yaw_rate;
    }
    else {
      resolved.yaw_rate = 0.0
    }

    if (msg.servo_frames !== undefined) {
      resolved.servo_frames = msg.servo_frames;
    }
    else {
      resolved.servo_frames = 0.0
    }

    if (msg.left_wheel_displacement !== undefined) {
      resolved.left_wheel_displacement = msg.left_wheel_displacement;
    }
    else {
      resolved.left_wheel_displacement = 0.0
    }

    if (msg.right_wheel_displacement !== undefined) {
      resolved.right_wheel_displacement = msg.right_wheel_displacement;
    }
    else {
      resolved.right_wheel_displacement = 0.0
    }

    if (msg.forward_displacement !== undefined) {
      resolved.forward_displacement = msg.forward_displacement;
    }
    else {
      resolved.forward_displacement = 0.0
    }

    if (msg.yaw_displacement !== undefined) {
      resolved.yaw_displacement = msg.yaw_displacement;
    }
    else {
      resolved.yaw_displacement = 0.0
    }

    if (msg.left_motor_torque !== undefined) {
      resolved.left_motor_torque = msg.left_motor_torque;
    }
    else {
      resolved.left_motor_torque = 0.0
    }

    if (msg.right_motor_torque !== undefined) {
      resolved.right_motor_torque = msg.right_motor_torque;
    }
    else {
      resolved.right_motor_torque = 0.0
    }

    if (msg.operation_mode !== undefined) {
      resolved.operation_mode = msg.operation_mode;
    }
    else {
      resolved.operation_mode = 0
    }

    if (msg.gain_schedule !== undefined) {
      resolved.gain_schedule = msg.gain_schedule;
    }
    else {
      resolved.gain_schedule = 0
    }

    if (msg.ui_battery !== undefined) {
      resolved.ui_battery = msg.ui_battery;
    }
    else {
      resolved.ui_battery = 0.0
    }

    if (msg.powerbase_battery !== undefined) {
      resolved.powerbase_battery = msg.powerbase_battery;
    }
    else {
      resolved.powerbase_battery = 0.0
    }

    if (msg.motors_enabled !== undefined) {
      resolved.motors_enabled = msg.motors_enabled;
    }
    else {
      resolved.motors_enabled = false
    }

    return resolved;
    }
};

// Constants for message
SegwayStatus.Constants = {
  LIGHT: 1,
  TALL: 2,
  HEAVY: 3,
  BALANCE: 1,
  TRACTOR: 2,
  POWER_DOWN: 3,
}

module.exports = SegwayStatus;

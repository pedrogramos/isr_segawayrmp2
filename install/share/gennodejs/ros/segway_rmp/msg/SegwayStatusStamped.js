// Auto-generated. Do not edit!

// (in-package segway_rmp.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SegwayStatus = require('./SegwayStatus.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SegwayStatusStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.segway = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('segway')) {
        this.segway = initObj.segway
      }
      else {
        this.segway = new SegwayStatus();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SegwayStatusStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [segway]
    bufferOffset = SegwayStatus.serialize(obj.segway, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SegwayStatusStamped
    let len;
    let data = new SegwayStatusStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [segway]
    data.segway = SegwayStatus.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 67;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segway_rmp/SegwayStatusStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f11247ac7dcf2a8717603cc53878eec2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header       header                      # Timestamp, sequence number, and frame id
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SegwayStatusStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.segway !== undefined) {
      resolved.segway = SegwayStatus.Resolve(msg.segway)
    }
    else {
      resolved.segway = new SegwayStatus()
    }

    return resolved;
    }
};

module.exports = SegwayStatusStamped;

// Auto-generated. Do not edit!

// (in-package rosserial_arduino.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class sensors {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ir1 = null;
      this.ir2 = null;
      this.ir3 = null;
      this.ir4 = null;
      this.s1 = null;
      this.s2 = null;
      this.s5 = null;
    }
    else {
      if (initObj.hasOwnProperty('ir1')) {
        this.ir1 = initObj.ir1
      }
      else {
        this.ir1 = 0;
      }
      if (initObj.hasOwnProperty('ir2')) {
        this.ir2 = initObj.ir2
      }
      else {
        this.ir2 = 0;
      }
      if (initObj.hasOwnProperty('ir3')) {
        this.ir3 = initObj.ir3
      }
      else {
        this.ir3 = 0;
      }
      if (initObj.hasOwnProperty('ir4')) {
        this.ir4 = initObj.ir4
      }
      else {
        this.ir4 = 0;
      }
      if (initObj.hasOwnProperty('s1')) {
        this.s1 = initObj.s1
      }
      else {
        this.s1 = 0;
      }
      if (initObj.hasOwnProperty('s2')) {
        this.s2 = initObj.s2
      }
      else {
        this.s2 = 0;
      }
      if (initObj.hasOwnProperty('s5')) {
        this.s5 = initObj.s5
      }
      else {
        this.s5 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sensors
    // Serialize message field [ir1]
    bufferOffset = _serializer.uint8(obj.ir1, buffer, bufferOffset);
    // Serialize message field [ir2]
    bufferOffset = _serializer.uint8(obj.ir2, buffer, bufferOffset);
    // Serialize message field [ir3]
    bufferOffset = _serializer.uint8(obj.ir3, buffer, bufferOffset);
    // Serialize message field [ir4]
    bufferOffset = _serializer.uint8(obj.ir4, buffer, bufferOffset);
    // Serialize message field [s1]
    bufferOffset = _serializer.uint8(obj.s1, buffer, bufferOffset);
    // Serialize message field [s2]
    bufferOffset = _serializer.uint8(obj.s2, buffer, bufferOffset);
    // Serialize message field [s5]
    bufferOffset = _serializer.uint8(obj.s5, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sensors
    let len;
    let data = new sensors(null);
    // Deserialize message field [ir1]
    data.ir1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ir2]
    data.ir2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ir3]
    data.ir3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ir4]
    data.ir4 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [s1]
    data.s1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [s2]
    data.s2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [s5]
    data.s5 = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rosserial_arduino/sensors';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9eedb779141fc8e42c127e038f10520e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ir1
    uint8 ir2
    uint8 ir3
    uint8 ir4
    uint8 s1
    uint8 s2
    uint8 s5
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sensors(null);
    if (msg.ir1 !== undefined) {
      resolved.ir1 = msg.ir1;
    }
    else {
      resolved.ir1 = 0
    }

    if (msg.ir2 !== undefined) {
      resolved.ir2 = msg.ir2;
    }
    else {
      resolved.ir2 = 0
    }

    if (msg.ir3 !== undefined) {
      resolved.ir3 = msg.ir3;
    }
    else {
      resolved.ir3 = 0
    }

    if (msg.ir4 !== undefined) {
      resolved.ir4 = msg.ir4;
    }
    else {
      resolved.ir4 = 0
    }

    if (msg.s1 !== undefined) {
      resolved.s1 = msg.s1;
    }
    else {
      resolved.s1 = 0
    }

    if (msg.s2 !== undefined) {
      resolved.s2 = msg.s2;
    }
    else {
      resolved.s2 = 0
    }

    if (msg.s5 !== undefined) {
      resolved.s5 = msg.s5;
    }
    else {
      resolved.s5 = 0
    }

    return resolved;
    }
};

module.exports = sensors;

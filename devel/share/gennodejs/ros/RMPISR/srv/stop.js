// Auto-generated. Do not edit!

// (in-package RMPISR.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class stopRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.size = null;
      this.pointArray = null;
    }
    else {
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0;
      }
      if (initObj.hasOwnProperty('pointArray')) {
        this.pointArray = initObj.pointArray
      }
      else {
        this.pointArray = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stopRequest
    // Serialize message field [size]
    bufferOffset = _serializer.uint8(obj.size, buffer, bufferOffset);
    // Serialize message field [pointArray]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.pointArray, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stopRequest
    let len;
    let data = new stopRequest(null);
    // Deserialize message field [size]
    data.size = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pointArray]
    data.pointArray = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RMPISR/stopRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5bbea48bfb057c91b7a5e97f25876fc2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 size
    geometry_msgs/Point pointArray
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new stopRequest(null);
    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0
    }

    if (msg.pointArray !== undefined) {
      resolved.pointArray = geometry_msgs.msg.Point.Resolve(msg.pointArray)
    }
    else {
      resolved.pointArray = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

class stopResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stopResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stopResponse
    let len;
    let data = new stopResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RMPISR/stopResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new stopResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: stopRequest,
  Response: stopResponse,
  md5sum() { return '5bbea48bfb057c91b7a5e97f25876fc2'; },
  datatype() { return 'RMPISR/stop'; }
};

// Auto-generated. Do not edit!

// (in-package perception_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class add_obstacleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xobj = null;
      this.yobj = null;
    }
    else {
      if (initObj.hasOwnProperty('xobj')) {
        this.xobj = initObj.xobj
      }
      else {
        this.xobj = 0.0;
      }
      if (initObj.hasOwnProperty('yobj')) {
        this.yobj = initObj.yobj
      }
      else {
        this.yobj = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type add_obstacleRequest
    // Serialize message field [xobj]
    bufferOffset = _serializer.float32(obj.xobj, buffer, bufferOffset);
    // Serialize message field [yobj]
    bufferOffset = _serializer.float32(obj.yobj, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type add_obstacleRequest
    let len;
    let data = new add_obstacleRequest(null);
    // Deserialize message field [xobj]
    data.xobj = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yobj]
    data.yobj = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'perception_pkg/add_obstacleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f8fb8420bfa4e803c844225154ef8e5f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 xobj
    float32 yobj
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new add_obstacleRequest(null);
    if (msg.xobj !== undefined) {
      resolved.xobj = msg.xobj;
    }
    else {
      resolved.xobj = 0.0
    }

    if (msg.yobj !== undefined) {
      resolved.yobj = msg.yobj;
    }
    else {
      resolved.yobj = 0.0
    }

    return resolved;
    }
};

class add_obstacleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type add_obstacleResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type add_obstacleResponse
    let len;
    let data = new add_obstacleResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'perception_pkg/add_obstacleResponse';
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
    const resolved = new add_obstacleResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: add_obstacleRequest,
  Response: add_obstacleResponse,
  md5sum() { return 'f8fb8420bfa4e803c844225154ef8e5f'; },
  datatype() { return 'perception_pkg/add_obstacle'; }
};

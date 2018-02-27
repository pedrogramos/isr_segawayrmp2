// Auto-generated. Do not edit!

// (in-package RMPISR.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class addpointRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xf = null;
      this.yf = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('xf')) {
        this.xf = initObj.xf
      }
      else {
        this.xf = 0.0;
      }
      if (initObj.hasOwnProperty('yf')) {
        this.yf = initObj.yf
      }
      else {
        this.yf = 0.0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addpointRequest
    // Serialize message field [xf]
    bufferOffset = _serializer.float64(obj.xf, buffer, bufferOffset);
    // Serialize message field [yf]
    bufferOffset = _serializer.float64(obj.yf, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.bool(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addpointRequest
    let len;
    let data = new addpointRequest(null);
    // Deserialize message field [xf]
    data.xf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yf]
    data.yf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RMPISR/addpointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2c13470f9a76d841f1bd464dbd411b07';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 xf
    float64 yf
    bool type
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new addpointRequest(null);
    if (msg.xf !== undefined) {
      resolved.xf = msg.xf;
    }
    else {
      resolved.xf = 0.0
    }

    if (msg.yf !== undefined) {
      resolved.yf = msg.yf;
    }
    else {
      resolved.yf = 0.0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = false
    }

    return resolved;
    }
};

class addpointResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addpointResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addpointResponse
    let len;
    let data = new addpointResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RMPISR/addpointResponse';
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
    const resolved = new addpointResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: addpointRequest,
  Response: addpointResponse,
  md5sum() { return '2c13470f9a76d841f1bd464dbd411b07'; },
  datatype() { return 'RMPISR/addpoint'; }
};

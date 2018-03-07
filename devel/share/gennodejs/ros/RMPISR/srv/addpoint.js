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

class addpointRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pointArray = null;
      this.type = null;
      this.size = null;
    }
    else {
      if (initObj.hasOwnProperty('pointArray')) {
        this.pointArray = initObj.pointArray
      }
      else {
        this.pointArray = [];
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = false;
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addpointRequest
    // Serialize message field [pointArray]
    // Serialize the length for message field [pointArray]
    bufferOffset = _serializer.uint32(obj.pointArray.length, buffer, bufferOffset);
    obj.pointArray.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [type]
    bufferOffset = _serializer.bool(obj.type, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = _serializer.int32(obj.size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addpointRequest
    let len;
    let data = new addpointRequest(null);
    // Deserialize message field [pointArray]
    // Deserialize array length for message field [pointArray]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pointArray = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pointArray[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [type]
    data.type = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.pointArray.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RMPISR/addpointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7da3ac5df9a593780eabd65b2f6b4ceb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] pointArray
    bool type
    int32 size
    
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
    const resolved = new addpointRequest(null);
    if (msg.pointArray !== undefined) {
      resolved.pointArray = new Array(msg.pointArray.length);
      for (let i = 0; i < resolved.pointArray.length; ++i) {
        resolved.pointArray[i] = geometry_msgs.msg.Point.Resolve(msg.pointArray[i]);
      }
    }
    else {
      resolved.pointArray = []
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = false
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0
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
  md5sum() { return '7da3ac5df9a593780eabd65b2f6b4ceb'; },
  datatype() { return 'RMPISR/addpoint'; }
};

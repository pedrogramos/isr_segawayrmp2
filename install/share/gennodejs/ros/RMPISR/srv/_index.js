
"use strict";

let resetrmp = require('./resetrmp.js')
let addpoint = require('./addpoint.js')
let stop = require('./stop.js')
let go = require('./go.js')
let odomError = require('./odomError.js')
let markerdetected = require('./markerdetected.js')

module.exports = {
  resetrmp: resetrmp,
  addpoint: addpoint,
  stop: stop,
  go: go,
  odomError: odomError,
  markerdetected: markerdetected,
};

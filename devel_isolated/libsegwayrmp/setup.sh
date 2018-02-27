#!/usr/bin/env sh
# generated from catkin.builder module

# remember type of shell if not already set
if [ -z "$CATKIN_SHELL" ]; then
  CATKIN_SHELL=sh
fi
. "/home/rmp/catkin_ws/devel_isolated/serial/setup.$CATKIN_SHELL"

# detect if running on Darwin platform
_UNAME=`uname -s`
IS_DARWIN=0
if [ "$_UNAME" = "Darwin" ]; then
  IS_DARWIN=1
fi

# Prepend to the environment
export CMAKE_PREFIX_PATH="/home/rmp/catkin_ws/devel_isolated/libsegwayrmp:$CMAKE_PREFIX_PATH"
if [ $IS_DARWIN -eq 0 ]; then
  export LD_LIBRARY_PATH="/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib:/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib/i386-linux-gnu:$LD_LIBRARY_PATH"
else
  export DYLD_LIBRARY_PATH="/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib:/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib/i386-linux-gnu:$DYLD_LIBRARY_PATH"
fi
export PATH="/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/bin:$PATH"
export PKG_CONFIG_PATH="/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib/pkgconfig:/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib/i386-linux-gnu/pkgconfig:$PKG_CONFIG_PATH"
export PYTHONPATH="/home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib/python2.7/dist-packages:$PYTHONPATH"

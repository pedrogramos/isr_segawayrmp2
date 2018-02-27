find_path(libsegwayrmp_INCLUDE_DIRS segwayrmp/segwayrmp.h
  /home/rmp/catkin_ws/devel_isolated/libsegwayrmp/include
  /usr/include
  /usr/local/include
)

find_library(libsegwayrmp_LIBRARY segwayrmp
  /home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib
  /home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib64
  /usr/lib
  /usr/lib64
  /usr/local/lib
  /usr/local/lib64
)
set(libsegwayrmp_LIBRARIES ${libsegwayrmp_LIBRARY})

# Try to find the ftd2xx library for linux, darwin, and other unix platforms
if(UNIX)
  find_library(ftd2xx_LIBRARY ftd2xx
    /home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib
    /home/rmp/catkin_ws/devel_isolated/libsegwayrmp/lib64
    /usr/lib
    /usr/lib64
    /usr/local/lib
    /usr/local/lib64
  )
  list(APPEND libsegwayrmp_LIBRARIES ${ftd2xx_LIBRARY})
  # On linux the symbols for dlopen need to be explicitly linked against
  if(NOT APPLE)
    list(APPEND libsegwayrmp_LIBRARIES dl)
  endif()
endif()

if(NOT libsegwayrmp_INCLUDE_DIRS OR NOT libsegwayrmp_LIBRARIES)
  set(libsegwayrmp_FOUND FALSE)
else()
  set(libsegwayrmp_FOUND TRUE)
endif()

# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "RMPISR: 1 messages, 6 services")

set(MSG_I_FLAGS "-IRMPISR:/home/rmp/catkin_ws/src/RMPISR/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(RMPISR_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" ""
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" "geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" ""
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" ""
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" "geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" NAME_WE)
add_custom_target(_RMPISR_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RMPISR" "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)

### Generating Services
_generate_srv_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)
_generate_srv_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)
_generate_srv_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)
_generate_srv_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)
_generate_srv_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)
_generate_srv_cpp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
)

### Generating Module File
_generate_module_cpp(RMPISR
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(RMPISR_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(RMPISR_generate_messages RMPISR_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_cpp _RMPISR_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RMPISR_gencpp)
add_dependencies(RMPISR_gencpp RMPISR_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RMPISR_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)

### Generating Services
_generate_srv_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)
_generate_srv_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)
_generate_srv_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)
_generate_srv_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)
_generate_srv_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)
_generate_srv_eus(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
)

### Generating Module File
_generate_module_eus(RMPISR
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(RMPISR_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(RMPISR_generate_messages RMPISR_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_eus _RMPISR_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RMPISR_geneus)
add_dependencies(RMPISR_geneus RMPISR_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RMPISR_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)

### Generating Services
_generate_srv_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)
_generate_srv_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)
_generate_srv_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)
_generate_srv_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)
_generate_srv_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)
_generate_srv_lisp(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
)

### Generating Module File
_generate_module_lisp(RMPISR
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(RMPISR_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(RMPISR_generate_messages RMPISR_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_lisp _RMPISR_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RMPISR_genlisp)
add_dependencies(RMPISR_genlisp RMPISR_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RMPISR_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)

### Generating Services
_generate_srv_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)
_generate_srv_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)
_generate_srv_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)
_generate_srv_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)
_generate_srv_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)
_generate_srv_nodejs(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
)

### Generating Module File
_generate_module_nodejs(RMPISR
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(RMPISR_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(RMPISR_generate_messages RMPISR_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_nodejs _RMPISR_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RMPISR_gennodejs)
add_dependencies(RMPISR_gennodejs RMPISR_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RMPISR_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)

### Generating Services
_generate_srv_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)
_generate_srv_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)
_generate_srv_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)
_generate_srv_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)
_generate_srv_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)
_generate_srv_py(RMPISR
  "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
)

### Generating Module File
_generate_module_py(RMPISR
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(RMPISR_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(RMPISR_generate_messages RMPISR_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/msg/sensors.msg" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/addpoint.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/odomError.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/go.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/markerdetected.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/resetrmp.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/RMPISR/srv/stop.srv" NAME_WE)
add_dependencies(RMPISR_generate_messages_py _RMPISR_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RMPISR_genpy)
add_dependencies(RMPISR_genpy RMPISR_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RMPISR_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RMPISR
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(RMPISR_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(RMPISR_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(RMPISR_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RMPISR
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(RMPISR_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(RMPISR_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(RMPISR_generate_messages_eus std_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RMPISR
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(RMPISR_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(RMPISR_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(RMPISR_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RMPISR
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(RMPISR_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(RMPISR_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(RMPISR_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RMPISR
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(RMPISR_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(RMPISR_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(RMPISR_generate_messages_py std_srvs_generate_messages_py)
endif()

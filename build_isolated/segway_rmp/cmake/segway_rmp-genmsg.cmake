# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "segway_rmp: 2 messages, 0 services")

set(MSG_I_FLAGS "-Isegway_rmp:/home/rmp/catkin_ws/src/segway_rmp-master/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(segway_rmp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" NAME_WE)
add_custom_target(_segway_rmp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segway_rmp" "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" ""
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" NAME_WE)
add_custom_target(_segway_rmp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segway_rmp" "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" "segway_rmp/SegwayStatus:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segway_rmp
)
_generate_msg_cpp(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segway_rmp
)

### Generating Services

### Generating Module File
_generate_module_cpp(segway_rmp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segway_rmp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(segway_rmp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(segway_rmp_generate_messages segway_rmp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_cpp _segway_rmp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_cpp _segway_rmp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segway_rmp_gencpp)
add_dependencies(segway_rmp_gencpp segway_rmp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segway_rmp_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segway_rmp
)
_generate_msg_eus(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segway_rmp
)

### Generating Services

### Generating Module File
_generate_module_eus(segway_rmp
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segway_rmp
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(segway_rmp_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(segway_rmp_generate_messages segway_rmp_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_eus _segway_rmp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_eus _segway_rmp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segway_rmp_geneus)
add_dependencies(segway_rmp_geneus segway_rmp_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segway_rmp_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segway_rmp
)
_generate_msg_lisp(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segway_rmp
)

### Generating Services

### Generating Module File
_generate_module_lisp(segway_rmp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segway_rmp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(segway_rmp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(segway_rmp_generate_messages segway_rmp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_lisp _segway_rmp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_lisp _segway_rmp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segway_rmp_genlisp)
add_dependencies(segway_rmp_genlisp segway_rmp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segway_rmp_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segway_rmp
)
_generate_msg_nodejs(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segway_rmp
)

### Generating Services

### Generating Module File
_generate_module_nodejs(segway_rmp
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segway_rmp
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(segway_rmp_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(segway_rmp_generate_messages segway_rmp_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_nodejs _segway_rmp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_nodejs _segway_rmp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segway_rmp_gennodejs)
add_dependencies(segway_rmp_gennodejs segway_rmp_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segway_rmp_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segway_rmp
)
_generate_msg_py(segway_rmp
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segway_rmp
)

### Generating Services

### Generating Module File
_generate_module_py(segway_rmp
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segway_rmp
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(segway_rmp_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(segway_rmp_generate_messages segway_rmp_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatus.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_py _segway_rmp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/segway_rmp-master/msg/SegwayStatusStamped.msg" NAME_WE)
add_dependencies(segway_rmp_generate_messages_py _segway_rmp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segway_rmp_genpy)
add_dependencies(segway_rmp_genpy segway_rmp_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segway_rmp_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segway_rmp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segway_rmp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(segway_rmp_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segway_rmp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segway_rmp
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(segway_rmp_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segway_rmp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segway_rmp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(segway_rmp_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segway_rmp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segway_rmp
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(segway_rmp_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segway_rmp)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segway_rmp\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segway_rmp
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(segway_rmp_generate_messages_py std_msgs_generate_messages_py)
endif()

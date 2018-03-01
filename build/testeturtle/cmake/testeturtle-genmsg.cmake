# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "testeturtle: 0 messages, 3 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(testeturtle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" NAME_WE)
add_custom_target(_testeturtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "testeturtle" "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" ""
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" NAME_WE)
add_custom_target(_testeturtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "testeturtle" "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" ""
)

get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" NAME_WE)
add_custom_target(_testeturtle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "testeturtle" "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/testeturtle
)
_generate_srv_cpp(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/testeturtle
)
_generate_srv_cpp(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/testeturtle
)

### Generating Module File
_generate_module_cpp(testeturtle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/testeturtle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(testeturtle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(testeturtle_generate_messages testeturtle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_cpp _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_cpp _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_cpp _testeturtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(testeturtle_gencpp)
add_dependencies(testeturtle_gencpp testeturtle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS testeturtle_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/testeturtle
)
_generate_srv_eus(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/testeturtle
)
_generate_srv_eus(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/testeturtle
)

### Generating Module File
_generate_module_eus(testeturtle
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/testeturtle
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(testeturtle_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(testeturtle_generate_messages testeturtle_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_eus _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_eus _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_eus _testeturtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(testeturtle_geneus)
add_dependencies(testeturtle_geneus testeturtle_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS testeturtle_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/testeturtle
)
_generate_srv_lisp(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/testeturtle
)
_generate_srv_lisp(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/testeturtle
)

### Generating Module File
_generate_module_lisp(testeturtle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/testeturtle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(testeturtle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(testeturtle_generate_messages testeturtle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_lisp _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_lisp _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_lisp _testeturtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(testeturtle_genlisp)
add_dependencies(testeturtle_genlisp testeturtle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS testeturtle_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/testeturtle
)
_generate_srv_nodejs(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/testeturtle
)
_generate_srv_nodejs(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/testeturtle
)

### Generating Module File
_generate_module_nodejs(testeturtle
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/testeturtle
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(testeturtle_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(testeturtle_generate_messages testeturtle_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_nodejs _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_nodejs _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_nodejs _testeturtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(testeturtle_gennodejs)
add_dependencies(testeturtle_gennodejs testeturtle_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS testeturtle_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle
)
_generate_srv_py(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle
)
_generate_srv_py(testeturtle
  "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle
)

### Generating Module File
_generate_module_py(testeturtle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(testeturtle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(testeturtle_generate_messages testeturtle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/addpoint.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_py _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/go.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_py _testeturtle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rmp/catkin_ws/src/testeturtle/srv/stop.srv" NAME_WE)
add_dependencies(testeturtle_generate_messages_py _testeturtle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(testeturtle_genpy)
add_dependencies(testeturtle_genpy testeturtle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS testeturtle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/testeturtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/testeturtle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(testeturtle_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(testeturtle_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(testeturtle_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/testeturtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/testeturtle
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(testeturtle_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(testeturtle_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(testeturtle_generate_messages_eus std_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/testeturtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/testeturtle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(testeturtle_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(testeturtle_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(testeturtle_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/testeturtle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/testeturtle
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(testeturtle_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(testeturtle_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(testeturtle_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/testeturtle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(testeturtle_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(testeturtle_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(testeturtle_generate_messages_py std_srvs_generate_messages_py)
endif()

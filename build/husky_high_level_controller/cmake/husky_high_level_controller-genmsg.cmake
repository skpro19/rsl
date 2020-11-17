# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "husky_high_level_controller: 0 messages, 1 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(husky_high_level_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" NAME_WE)
add_custom_target(_husky_high_level_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "husky_high_level_controller" "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(husky_high_level_controller
  "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/husky_high_level_controller
)

### Generating Module File
_generate_module_cpp(husky_high_level_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/husky_high_level_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(husky_high_level_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(husky_high_level_controller_generate_messages husky_high_level_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" NAME_WE)
add_dependencies(husky_high_level_controller_generate_messages_cpp _husky_high_level_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(husky_high_level_controller_gencpp)
add_dependencies(husky_high_level_controller_gencpp husky_high_level_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS husky_high_level_controller_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(husky_high_level_controller
  "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/husky_high_level_controller
)

### Generating Module File
_generate_module_eus(husky_high_level_controller
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/husky_high_level_controller
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(husky_high_level_controller_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(husky_high_level_controller_generate_messages husky_high_level_controller_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" NAME_WE)
add_dependencies(husky_high_level_controller_generate_messages_eus _husky_high_level_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(husky_high_level_controller_geneus)
add_dependencies(husky_high_level_controller_geneus husky_high_level_controller_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS husky_high_level_controller_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(husky_high_level_controller
  "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/husky_high_level_controller
)

### Generating Module File
_generate_module_lisp(husky_high_level_controller
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/husky_high_level_controller
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(husky_high_level_controller_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(husky_high_level_controller_generate_messages husky_high_level_controller_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" NAME_WE)
add_dependencies(husky_high_level_controller_generate_messages_lisp _husky_high_level_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(husky_high_level_controller_genlisp)
add_dependencies(husky_high_level_controller_genlisp husky_high_level_controller_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS husky_high_level_controller_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(husky_high_level_controller
  "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/husky_high_level_controller
)

### Generating Module File
_generate_module_nodejs(husky_high_level_controller
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/husky_high_level_controller
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(husky_high_level_controller_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(husky_high_level_controller_generate_messages husky_high_level_controller_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" NAME_WE)
add_dependencies(husky_high_level_controller_generate_messages_nodejs _husky_high_level_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(husky_high_level_controller_gennodejs)
add_dependencies(husky_high_level_controller_gennodejs husky_high_level_controller_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS husky_high_level_controller_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(husky_high_level_controller
  "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/husky_high_level_controller
)

### Generating Module File
_generate_module_py(husky_high_level_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/husky_high_level_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(husky_high_level_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(husky_high_level_controller_generate_messages husky_high_level_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/skpro19/git_test/rsl/src/husky_high_level_controller/srv/StartStopBot.srv" NAME_WE)
add_dependencies(husky_high_level_controller_generate_messages_py _husky_high_level_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(husky_high_level_controller_genpy)
add_dependencies(husky_high_level_controller_genpy husky_high_level_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS husky_high_level_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/husky_high_level_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/husky_high_level_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/husky_high_level_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/husky_high_level_controller
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/husky_high_level_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/husky_high_level_controller
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/husky_high_level_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/husky_high_level_controller
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/husky_high_level_controller)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/husky_high_level_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/husky_high_level_controller
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()

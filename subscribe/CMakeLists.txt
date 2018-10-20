cmake_minimum_required (VERSION 2.6)
project (Subscribe)

# The version number.
set (AWSTEST_VERSION_MAJOR 1)
set (AWSTEST_VERSION_MINOR 0)

# should we use our own math functions
option (USE_AWS_SDK "Use tutorial provied math implementation" ON)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TestConfig.h.in"
  "${PROJECT_BINARY_DIR}/TestConfig.h"
  )

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories ("${PROJECT_BINARY_DIR}")

# add the MathFunctions library?
if (USE_AWS_SDK)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif ()

# add the executable
add_executable (Subscribe sub_test.cxx)
target_link_libraries (Subscribe ${EXTRA_LIBS})


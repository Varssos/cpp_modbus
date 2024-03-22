# Below option needs to be set to TRUE

set(ENABLE_TOOLCHAIN FALSE)

# Alternatively for using external toolchain file you need to specify 
#
# 		cmake (...) -DCMAKE_TOOLCHAIN_FILE="path/to/the/toolchain_file.cmake" (...)
#
# or define variables when invoking cmake from commmand line
#
#		cmake \
#			(...) \
#			-DCMAKE_SYSTEM_NAME="..." \
#			-DCMAKE_SYSTEM_PROCESSOR="..." \
#			-DCMAKE_SYSROOT="..." \
#			-DCMAKE_STAGING_PREFIX="..." \
#			-DCMAKE_C_COMPILER="..." \
#			-DCMAKE_C_FLAGS="..." \
#			-DCMAKE_CXX_COMPILER="..." \
#			-DCMAKE_CXX_FLAGS="..." \
#			(...)
#

if( ${ENABLE_TOOLCHAIN} )
	set(CMAKE_SYSTEM_NAME "Linux")
	set(CMAKE_SYSTEM_PROCESSOR "")
	set(CMAKE_SYSROOT "")
	set(CMAKE_STAGING_PREFIX "")
	set(CMAKE_C_COMPILER "")
	set(CMAKE_C_FLAGS "")
	set(CMAKE_CXX_COMPILER "")
	set(CMAKE_CXX_FLAGS "")
	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
	set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
endif()
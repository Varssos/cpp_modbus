cmake_minimum_required(VERSION 3.16)

enable_language(CXX)
enable_language(C)


# Include module_config.cmake 
if ( NOT EXISTS "${CMAKE_CURRENT_LIST_DIR}/module_config.cmake" )
    message(FATAL_ERROR "module_config.cmake not found!")
else()
    include( ${CMAKE_CURRENT_LIST_DIR}/module_config.cmake)
endif()

# Include toolchain.cmake
if( EXISTS "${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake" )
    include( ${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake )
endif()

# Set VERSION
if((NOT DEFINED MAJOR) OR (NOT DEFINED MINOR) OR (NOT DEFINED PATCH) )
    message(FATAL_ERROR "MAJOR, MINOR or PATCH not specified. Check module_config.cmake.")
endif()

set(VERSION ${MAJOR}.${MINOR}.${PATCH})

# Set binary name ${TARGET_NAME}
project(${TARGET_NAME} LANGUAGES CXX VERSION ${VERSION})

# Set source paths
set(SOURCES_PATH "${CMAKE_CURRENT_LIST_DIR}/sources/")
set(SOURCES_SRC_PATH "${SOURCES_PATH}/src/")
set(SOURCES_INC_PATH "${SOURCES_PATH}/inc/")

message( STATUS "Building ${TARGET_NAME} ${VERSION}")

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True )

# Set CMAKE_BUILD_TYPE
if(NOT CMAKE_BUILD_TYPE)
    message(STATUS "CMAKE_BUILD_TYPE not defined. Set to Release")
    set(CMAKE_BUILD_TYPE Release)
elseif(NOT (${CMAKE_BUILD_TYPE} STREQUAL "Debug" OR ${CMAKE_BUILD_TYPE} STREQUAL "Release" ) )
    message(FATAL_ERROR "CMAKE_BUILD_TYPE must be either Release or Debug")
endif()

# Set in `SOURCE_DIRS` all abosulute directories for folders in ./sources/src/
file(GLOB SOURCE_DIRS ${SOURCES_SRC_PATH}/*)

# Set in `SRC_FILES_PATH` all source files paths
foreach( SOURCE_DIR ${SOURCE_DIRS})
    if( IS_DIRECTORY ${SOURCE_DIR})
        aux_source_directory(${SOURCE_DIR} SRC_FILES_PATH)
    endif()
endforeach()


# It makes an binary called ${PROJECT_NAME} and take source files
add_executable( ${PROJECT_NAME} ${SRC_FILES_PATH} ) 

# Include inc directory to project
target_include_directories(${TARGET_NAME} PRIVATE 
    $<BUILD_INTERFACE:${SOURCES_INC_PATH}>
)

# Link libraries
target_link_libraries(${TARGET_NAME} PRIVATE ${MODULE_DEPS} )


# Tests
if( ${TESTS} STREQUAL "True" )
include(tests.cmake)
endif()

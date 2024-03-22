if( NOT EXISTS "${CMAKE_CURRENT_LIST_DIR}/module_config.cmake" )
message(FATAL_ERROR "module_config.cmake not found!")
else()
include(${CMAKE_CURRENT_LIST_DIR}/module_config.cmake)
endif()

# Setup module deps as test deps
list(APPEND TEST_DEPS
    ${MODULE_DEPS})

# Setup tests directories
set(TESTS_PATH "${CMAKE_CURRENT_LIST_DIR}/tests")
set(TESTS_SRC_PATH "${TESTS_PATH}/src")
set(TESTS_INC_PATH "${TESTS_PATH}/inc")

file(GLOB TEST_DIRS ${TESTS_SRC_PATH} ${TESTS_SRC_PATH}/*)
foreach( TEST_DIR ${TEST_DIRS})
    if( IS_DIRECTORY ${TEST_DIR})
        aux_source_directory(${TEST_DIR} TEST_SRC_DIRS)
    endif()
endforeach()


#setup parent module directories
set(PARENT_PATH "${CMAKE_CURRENT_LIST_DIR}/sources")
set(PARENT_SRC_PATH "${PARENT_PATH}/src")
set(PARENT_INC_PATH "${PARENT_PATH}/inc")

file(GLOB PARENT_DIRS ${PARENT_SRC_PATH} ${PARENT_SRC_PATH}/*)
foreach( PARENT_DIR ${PARENT_DIRS})
    if( IS_DIRECTORY ${PARENT_DIR})
        aux_source_directory(${PARENT_DIR} MODULE_SRC_DIRS)
    endif()
endforeach()


find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

set(BUILD_GMOCK ON)

# add_executable(tests ./tests/src/gtest.cpp)
add_executable(tests ${TEST_SRC_DIRS})



# link libraries in group to prevent discarding of functions
target_link_libraries(tests ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES} gmock pthread)


target_include_directories(tests PUBLIC
    "$<BUILD_INTERFACE:${TESTS_INC_PATH}>"
    "$<BUILD_INTERFACE:${PARENT_INC_PATH}>"
)

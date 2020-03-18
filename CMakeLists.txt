cmake_minimum_required(VERSION 2.6)

project(gtestSample)

set (CMAKE_CXX_STANDARD 11)
set (CMAKE_CROSSCOMPILING TRUE)
set (CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)
set (CMAKE_C_COMPILER aarch64-linux-gnu-gcc)


set(TARGET ${CMAKE_PROJECT_NAME})

set(SRC
	src/main.cpp
	src/absol.cpp
	src/multi.cpp
)

add_executable(${TARGET} ${SRC})

add_subdirectory(unittest)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")

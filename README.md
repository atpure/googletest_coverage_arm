# googletest_coverage_arm

## Make gtest library
\$ sudo apt-get install g++-aarch64-linux-gnu

\$ sudo apt-get install libgtest-dev

\$ cd /usr/src/gtest

\$ sudo aarch64-linux-gnu-g++ -std=c++11 -isystem /usr/src/gtest/include -I/usr/src/gtest -pthread -c /usr/src/gtest/src/gtest-all.cc

\$ sudo ar -rv libgtest-arm.a gtest-all.o

\$ sudo cp libgtest-arm.a /usr/lib

## CMakeLists.txt
set (CMAKE_CROSSCOMPILING TRUE)

set (CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)

set (CMAKE_C_COMPILER aarch64-linux-gnu-gcc)

INCLUDE_DIRECTORIES (/usr/include/gtest)

TARGET_LINK_LIBRARIES(${TARGET} /user/lib/libgtest-arm.a -lpthread)

## Build
\$ mkdir build

\$ cd build

\$ cmake ..

\$ make

## Run Google Test
\$ ./unittest/gtestSample_test

## Rusult of Google Test
[==========] Running 1 test from 1 test case.

[----------] Global test environment set-up.

[----------] 1 test from AbsTest

[ RUN      ] AbsTest.PositiveNos

[       OK ] AbsTest.PositiveNos (0 ms)

[----------] 1 test from AbsTest (0 ms total)


[----------] Global test environment tear-down

[==========] 1 test from 1 test case ran. (0 ms total)

[  PASSED  ] 1 test.

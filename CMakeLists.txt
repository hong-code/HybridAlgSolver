# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.9)

# 项目信息
project (HYBRIDALGSOLVER)


# 二进制
add_executable(String_Solver main.cpp)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -O0")
# 添加子目录
add_subdirectory(Solver)
add_subdirectory(Parser)
add_subdirectory(Membership)
# target_link_libraries(String1_Solver Solverbin Parserbin)
target_link_libraries(String_Solver Parserbin Solverbin)

# 查找 OpenSSL
find_package(OpenSSL REQUIRED)

add_executable(IntersectionK IntersectionK.cpp)
target_link_libraries(IntersectionK Parserbin Solverbin)

add_executable(PositionTest PositionTest.cpp)
target_link_libraries(PositionTest Parserbin Solverbin)

add_executable(Match Match.cpp)
target_link_libraries(Match Parserbin Solverbin MembershipBin)

add_executable(DetectAmbiguity DetectAmbiguity.cpp)
target_link_libraries(DetectAmbiguity Parserbin Solverbin OpenSSL::SSL OpenSSL::Crypto)

add_executable(Completment Completment_Main.cpp)
target_link_libraries(Completment Parserbin Solverbin)
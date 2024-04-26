# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.9)

# 项目信息
project (HYBRIDALGSOLVER)

# 二进制
add_executable(String_Solver main.cpp)

# 添加子目录
add_subdirectory(Solver)
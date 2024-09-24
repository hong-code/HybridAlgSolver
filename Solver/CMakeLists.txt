# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)

# 生成链接库

add_library (Solverbin ${DIR_LIB_SRCS}
                        String/regexp_symbolic.cpp
                        String/regexp_symbolic_intersection.cpp
                        String/regexp_symbolic_follow.cpp
                        String/regexp_symbolic_inclusion.cpp
                        String/regexp_symbolic_intersectionK.cpp
                        String/regexp_symbolic_Completment.cpp
                        PositionAutomaton/PositionAutomaton.h
                        PositionAutomaton/Intersectiontest.h
                        PositionAutomaton/Intersectiontest.cpp
                        PositionAutomaton/PositionAutomaton.cpp
                        PositionAutomaton/Completment.cpp
                        PositionAutomaton/DFA.cpp
                        DetectAmbiguity/DetectAmbiguity.h
                        DetectAmbiguity/DetectAmbiguity.cpp
                        DetectAmbiguity_WithLookAround/DetectAmbiguity.h
                        DetectAmbiguity_WithLookAround/DetectAmbiguity.cpp
                        )
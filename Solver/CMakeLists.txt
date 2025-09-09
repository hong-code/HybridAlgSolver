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
                        Automaton/PositionAutomaton.h
                        Automaton/Intersectiontest.h
                        Automaton/Intersectiontest.cpp
                        Automaton/PositionAutomaton.cpp
                        Automaton/Completment.cpp
                        Automaton/DFA.cpp
                        Automaton/FollowAutomaton.h
                        Automaton/FollowAutomaton.cpp
                        DetectAmbiguity/DetectAmbiguity.h
                        DetectAmbiguity/DetectAmbiguity.cpp
                        DetectAmbiguity_WithLookAround/DetectAmbiguity.h
                        DetectAmbiguity_WithLookAround/DetectAmbiguity.cpp
                        GenerateEulerStr/GenerateEulerStr.h
                        GenerateEulerStr/GenerateEulerStr.cpp
                        Utils/Utils.cpp
                        Utils/Utils.h
                        )
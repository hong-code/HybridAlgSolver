import os
import subprocess
# 导入线程池模块
import concurrent.futures
import re
import os
import subprocess
import signal
import functools
from concurrent import futures
import time
import subprocess
import shutil
import sqlite3
import threading
from timeit import default_timer as timer
from concurrent.futures import ThreadPoolExecutor,as_completed


# 读取/home/supermaxine/Documents/USENIX24/AttackStringGen/regex_set/regexes下1.txt到736535.txt
path = '/home/HybridAlgSolver/Test/regexes'
Output = '/home/HybridAlgSolver/Output'
count = 0
# Islazy = 0
# IsRandom = 0
# IsFull = 0
# IsRever = 1




# with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:

    # 使用线程池执行任务
    # 编译文件
def dotask(id, Output, Length, Islazy, IsRandom, IsFullMatch, IsReverse):
    command = "timeout 40s /home/HybridAlgSolver/build/GREWIA %s %s %s %s %s %s %s"  % (path + '/'+ id, Output, Length, Islazy, IsRandom, IsFullMatch, IsReverse)
    print(command)
    output = subprocess.Popen(command,  stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True,
            text=True)
    # if len(output.read()) == 0:
    #     print("-"*20, "\ntask {} is done".format(id),"\n", output.read(), "\n", "-"*20)
    stdout, stderr = output.communicate()
    if output.returncode == -11:  # -11 is the typical exit code for segmentation fault on Unix systems
        print("Segmentation fault (core dumped)")
    print("Standard Output:\n", stdout)
    # print("Standard Error:\n", stderr)    

filenames=os.listdir(path)
thread_num = 16
with ThreadPoolExecutor(max_workers=thread_num) as executor:
    for i in range(len(filenames)):
        print(str(i) + ": " + filenames[i].split('.')[0])
        executor.submit(dotask, filenames[i], Output + '/' + filenames[i].split('.')[0], 100000, 0, 0, 1, 0)    


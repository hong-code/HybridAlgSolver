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
import psutil
import shutil
import sqlite3
import threading
from timeit import default_timer as timer
from concurrent.futures import ThreadPoolExecutor,as_completed


# 读取/home/supermaxine/Documents/USENIX24/AttackStringGen/regex_set/regexes下1.txt到736535.txt
path = '/home/HybridAlgSolver/Test/regexes'
Output = '/home/HybridAlgSolver/Output'
count = 0
Islazy = 1
IsRandom = 0




# with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:

    # 使用线程池执行任务
    # 编译文件
def dotask(id, Output, Length, Islazy):

    filenames = os.listdir(Output)

    for filename in filenames:
        command = "timeout 2s /home/HybridAlgSolver/PCRE2/PCREMatch %s %s" % (path + '/'+ id, Output + '/' + filename)
        print(command)
        output = subprocess.Popen(command,  stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                shell=True,
                text=True)
        # if len(output.read()) == 0:
        #     print("-"*20, "\ntask {} is done".format(id),"\n", output.read(), "\n", "-"*20)
        stdout, stderr = output.communicate()

        # 获取启动的子进程的 pid
        pid = output.pid

        # 获取 psutil 的进程对象
        proc = psutil.Process(pid)

        # 获取子进程开始时的用户时间
        start_time = time.time()
        start_cpu_time = proc.cpu_times().user  # 获取用户 CPU 时间（单位：秒）

        # 等待子进程完成
        Output.wait()

        # 获取子进程完成时的用户时间
        end_cpu_time = proc.cpu_times().user

        # 计算总的用户 CPU 时间
        total_cpu_time = end_cpu_time - start_cpu_time
        if total_cpu_time >= 1:
            print("task {} is done".format(id))
            break
        if output.returncode == -11:  # -11 is the typical exit code for segmentation fault on Unix systems
            print("Segmentation fault (core dumped)")
        print("Standard Output:\n", stdout)
    # print("Standard Error:\n", stderr)    

filenames=os.listdir(path)
thread_num = 32
with ThreadPoolExecutor(max_workers=thread_num) as executor:
    for i in range(len(filenames)):
        print(str(i) + ": " + filenames[i].split('.')[0])
        executor.submit(dotask, filenames[i], Output + '/' + filenames[i].split('.')[0], 100000, 0)    


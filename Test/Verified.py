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
    if not os.path.exists(Output):
        return
    filenames = os.listdir(Output)

    for filename in filenames:
        # command = "timeout 2s /home/HybridAlgSolver/PCRE2/PCREMatch %s %s" % (path + '/'+ id + '.txt', Output + '/' + filename)
        command = "timeout 2s perl /home/HybridAlgSolver/PerlMatch/benchmark.pl %s %s" % (path + '/'+ id + '.txt', Output + '/' + filename)
        print(command)
        process = subprocess.Popen(command,  stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                shell=True,
                text=True)
        # if len(output.read()) == 0:
        #     print("-"*20, "\ntask {} is done".format(id),"\n", output.read(), "\n", "-"*20)
        # 获取该进程的 PID
        pid = process.pid
        try:
            # 获取进程的 psutil 对象
            p = psutil.Process(pid)

            # 获取启动前的 CPU 时间
            start_cpu_times = time.time()

            # 等待命令执行完毕并获取输出
            stdout, stderr = process.communicate()

            # 获取命令执行结束后的 CPU 时间
            end_cpu_times = time.time()

            # 计算用户时间和系统时间
            # print(f"用户时间: {end_cpu_times:.2f} 秒，大于 1 秒，输出结果。")
            user_time = end_cpu_times - start_cpu_times
            # 判断用户时间是否大于 1 秒
            if user_time >= 1.0:
                # count = count + 1
                print(f"用户时间: {user_time:.2f} 秒，大于 1 秒，输出结果。")
                break
                # print(f"count: {count}")
                # if stdout:
                #     print(f"标准输出: {stdout}")
                # if stderr:
                #     print(f"错误输出: {stderr}")
        except psutil.NoSuchProcess:
            print("进程已结束，无法获取 CPU 时间")
        except psutil.AccessDenied:
            print("权限不足，无法访问进程信息")
        except Exception as e:
            print(f"出现其他错误: {e}")           
    # print("Standard Error:\n", stderr)    

filenames=os.listdir(Output)
thread_num = 10
with ThreadPoolExecutor(max_workers=thread_num) as executor:
    for i in range(len(filenames)):
        print(str(i) + ": " + filenames[i].split('.')[0])
        # dotask(filenames[i], Output + '/' + filenames[i].split('.')[0], 100000, 0)
        executor.submit(dotask, filenames[i], Output + '/' + filenames[i].split('.')[0], 100000, 0)    


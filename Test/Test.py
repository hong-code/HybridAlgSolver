import os
import subprocess
# 导入线程池模块
import concurrent.futures

# 读取/home/supermaxine/Documents/USENIX24/AttackStringGen/regex_set/regexes下1.txt到736535.txt
path = '/home/huanghong/HybridAlgSolver/Test/wash_inter_with_results'
count = 0

# 定义一个函数，用于执行任务
def do_task(id):
    print("-"*20, "\nsubmits task {}".format(id), "/", 736535, "\n", "-"*20)
    output = os.popen("timeout 600s /ComparativeTools/EvilStrGen/build/EvilStrGen %s %s 1 100000 0" % ("/ComparativeTools/regexes/{}.txt".format(id), "/ComparativeTools/Results/EvilStrGen/{}.txt".format(id)))
    print("-"*20, "\ntask {} is done".format(id),"\n", output.read(), "\n", "-"*20)



with concurrent.futures.ThreadPoolExecutor(max_workers=65) as executor:

    # 使用线程池执行任务
    # 编译文件
    filenames=os.listdir(path)
    print(filenames)
    for i in range(1, filenames.e):
        count += 1
        # if count <= 0 or count > 100:
        #     continue
        executor.submit(do_task, i)
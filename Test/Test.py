import os
import subprocess
# 导入线程池模块
import concurrent.futures

# 读取/home/supermaxine/Documents/USENIX24/AttackStringGen/regex_set/regexes下1.txt到736535.txt
path = '/home/huanghong/HybridAlgSolver/Test/wash_inter_with_results'
count = 0





# with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:

    # 使用线程池执行任务
    # 编译文件
def dotask(id, TF):
    command = "timeout 600s /home/huanghong/HybridAlgSolver/build/IntersectionK %s %s" % (path + '/'+ id, TF)
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
    print("Standard Error:\n", stderr)    

filenames=os.listdir(path)
for i in range(len(filenames)):
    print(str(i) + ": " + filenames[i])
    dotask(filenames[i], filenames[i][-5])


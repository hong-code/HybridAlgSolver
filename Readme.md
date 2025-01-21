# Intersection of Regex
#### Online Algorithms for Solving Regular Expression Intersection Non-emptiness
## Runtime environment
#### Here we will introduce how to set up a runtime environment

### Operating Systerm
```shell
Ubuntu20.04 # Other Ubuntu Long-Term Support (LTS) versions are also acceptable.
```

### Set up
```bash
sudo apt install build-essential  # install gcc, g++ and make
sudo apt install cmake  # install cmake
```

## Running Commands
#### Here, we will introduce how to run our tool.

### Directory structure
```shell
HybridAlgSolver/
├── Membership
├── Parser
├── Solver # Solving Regular Expression Intersection Non-emptiness
    ├── String
    ├── solver.cpp
    ├── ...
└── IntersectionK.cpp  #main code
```
### Building and Running
```bash
cd HybridAlgSolver # Enter the root directory of the project
mkdir build && cd build # create build directory
cmake .. # load cmakelist file
make # compile into .exe file
./IntersectionK [RegexFile]  # running command
```
## Running example
 
#### A file `test.txt` containing three regexes is shown below:
```
\w*
hos\w*name2024
hostname[2024]+
```
#### And running the command:
```bash
./IntersectionK 
```
#### Its outputs will be printed in the shell:
```bash
sat
witness string: hostname2024
```

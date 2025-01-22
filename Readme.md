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
sudo apt install libssl-dev # install OpenSSL to encode and decode base64
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
└── GREWIA.cpp  #main code
```
### Building and Running
```bash
cd HybridAlgSolver # Enter the root directory of the project
mkdir build && cd build # create build directory
cmake .. # load cmakelist file
make # compile into .exe file
./GREWIA -h # to get more information of the parameters of GREWIA.
./GREWIA [RegexFile] [OutputDirectory] [AttackStringLength] [SimplifiedModeOn] [DecrementalOn] [MatchingFunction] # running command
```
## Running example
 
#### A file `test.txt` containing three regexes is shown below:
```
hos\w*name:2024
```
#### And running the command:
```bash
./GREWIA PathTo/test.txt PathTo/Output/1 100000 0 1 1
```
#### Its outputs will be written to PathTo/Output/1:
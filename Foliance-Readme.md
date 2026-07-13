# Foliance
#### Computing attack strings and finite ambiguity degrees for regular expressions

## Runtime environment
#### Here we will introduce how to set up a runtime environment.

### Operating Systerm
```shell
Ubuntu20.04 # Other Ubuntu Long-Term Support (LTS) versions are also acceptable.
```

### Toolkit Version
```shell
gcc 11.4.0
cmake version 3.22.1
```

### Set up
```bash
sudo apt install build-essential  # install gcc, g++ and make
sudo apt install cmake  # install cmake
sudo apt install libssl-dev # install OpenSSL to encode and decode base64
```

## Running Commands
#### Here, we will introduce how to run Foliance.

### Directory structure
```shell
HybridAlgSolver/
├── Membership
├── Parser # Source code of parser
├── Solver # Source code
│   ├── DetectAmbiguity_WithLookAround
│   ├── PositionAutomaton
│   ├── solver.cpp
│   └── ...
├── GREWIA.cpp
└── Foliance.cpp  # main code of Foliance
```

### Building and Running
```bash
cd HybridAlgSolver # Enter the root directory of the project
mkdir build && cd build # create build directory
cmake .. # load CMakeLists.txt
make Foliance # compile Foliance
./Foliance [RegexFile] [AttackStringOutputFile] [AmbiguityOutputFile] [AttackStringLength] [SimplifiedModeOn] [DecrementalOn] [MatchingFunction]
```

### Parameters
```shell
[RegexFile]: Path of a file which contains regexes, one regex per line.
[AttackStringOutputFile]: Path of the file where attack strings will be written.
[AmbiguityOutputFile]: Path of the file where ambiguity degrees will be written.
[AttackStringLength]: Length used when searching candidate attack strings.
[SimplifiedModeOn]: Set to 1 to generate one attack string; set to 0 to generate a series of attack strings.
[DecrementalOn]: Set to 1 to enable decremental/random mode and vice versa.
[MatchingFunction]: Set to 1 for partialmatch; set to 0 for fullmatch.
```

## Running example

#### A file `test.txt` containing one regex is shown below:
```regex
\w*a\w{3},
```

#### And running the command:
```bash
./Foliance PathTo/test.txt PathTo/Output/foliance-attack.txt PathTo/Output/foliance-ambiguity.txt 100000 0 1 0
```

#### Its attack strings will be written to `PathTo/Output/foliance-attack.txt`:
```text
attack_string_for_regex_1
```

#### Its ambiguity degrees will be written to `PathTo/Output/foliance-ambiguity.txt`:
```text
1	ambiguity_degree_for_regex_1
```

The first column in the ambiguity output file is the line number of the regex in `RegexFile`, and the second column is the maximum finite ambiguity degree computed by Foliance.

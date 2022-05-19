## 0. Install npm, zlib, unzip, cmake(minimum version 3.10), gcc(minimum version 8.0), nodejs (if you machine does not have these libs)
```
sudo apt-get install zlib1g-dev unzip cmake gcc g++ nodejs
```

## 1. Install SVF and its dependence (LLVM pre-built binary) via npm
```
npm i --silent svf-lib --prefix ${HOME}
```

## 2. Setup SVF environment
```
source ./env.sh
```
## 3. build target svf-ex(executable) and svfext(library)
cmake the project (`cmake -DCMAKE_BUILD_TYPE=Debug .` for debug build)
```
cmake . && make
```

## 4. Analyze a bc file using svf-ex executable
```
clang -S -c -g -fno-discard-value-names -emit-llvm example.c -o example.ll
./bin/svf-ex example.ll
```
## 5 Analyze a bc file using python scrip(call library svfext)
python3 test.py example.ll

modify:
1. add a subdirectory svfext to build library svfext(SVF library wrapped)
2. add a python script file(test.py) to call SVF library

# Cpp_CMake_GTest_Template

My C++ project configuration

## 1. Definitions

`{PROJECT_ROOT}` - project root path.
`{BUILD_DIR}` - `build`


## 2. Dependencies

### 2.1 List of dependencies

- [gtest](https://github.com/google/googletest)
- [fmt](https://github.com/fmtlib/fmt)
- [libmodbus](https://github.com/stephane/libmodbus)


### 2.2 Preconditions

```
sudo apt-get install libtool autoconf automake pkg-config
```

### 2.2 Build of dependencies

To build and install module dependencies navigate to `{PROJECT_ROOT}` and invoke

```
git submodule init
git submodule update
make -C submodules
sudo make -C submodules install
```

Add to ~/.bashrc ?
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

## 3. Build

### 3.1 Requirements

- GCC >= 8.4 (version 8.4 provides experimental support)
- cmake >= 3.16

### 3.2 Build

Build with unit tests and in debug mode
```
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DTESTS=True
cmake --build build
sudo cmake --install build
```

## 4. Project contents
``` 
├── sources                 # sources directory
├── submodules              # submodules directory - dependencies are stored here
├── tests                   # tests directory - source code for unit testing
├── .vscode                 # my VS code configuration
├── CMakeLists.txt          # cmake directives
├── LICENSE                 # License doc
├── module_config.cmake     # basic module configuration
├── README.md               # this file
├── tests.cmake             # cmake for tests
├── toolchain.cmake         # toolchain configuration for cmake
├── .clang-format           # clang-format file which unify code style
├── .gitignore              # gitignore config file
└──  .gitmodules            # gitmodule config file
```

## 5. Run app and tests

### 5.1 Run app 
```
./build/app
```

### 5.2 Run tests
```
./build/tests
```


#!/bin/bash

# Requirements
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential cmake 

gcc --version
g++ --version

# Install dependencies

git submodule init
git submodule update
make -C submodules
sudo make -C submodules install


# Build app with unit tests and in debug mode
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DTESTS=True
cmake --build build
sudo cmake --install build
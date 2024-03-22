# Fetch ubuntu image
FROM ubuntu:22.04

# Install build tools
RUN apt update && \
    apt install -y git build-essential cmake

# Copy project into image
RUN mkdir /project
COPY . /project



# Install dependencies and setup gtest
RUN cd /project/ && \
    git submodule init && \
    git submodule update && \
    make -C submodules && \
    make -C submodules install

# Build app with unit tests 
RUN cd /project/ && \
    rm -rf ./build/ && \
    cmake -B build -DTESTS=True && \
    cmake --build build

# Execute unit tests
RUN /project/build/tests
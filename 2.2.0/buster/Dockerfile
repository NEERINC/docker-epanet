FROM debian:buster AS build

# Define the base workdir as /epanet
WORKDIR /epanet

# Install system dependencies
RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
    ca-certificates git build-essential cmake

# Clone EPASWMM source code for the specified version
RUN git clone -b v2.2.0 --depth 1 https://github.com/USEPA/epanet-solver .

# Create build folder
RUN mkdir build

# Change directory to the build folder
WORKDIR /epanet/build

# Run CMake to prepare a makefile
RUN cmake ..

# Make the library and binary files
RUN make

# Get a fresh image
FROM debian:buster

# Copy library and binary files from build stage
COPY --from=build /epanet/build/bin/libepanet2.so /usr/local/lib/libepanet2.so
COPY --from=build /epanet/build/bin/runepanet /usr/local/bin/runepanet

# Create sybmolic links for `runswmm` to commonly used binary names
RUN ln -s /usr/local/bin/runepanet /usr/local/bin/epanet

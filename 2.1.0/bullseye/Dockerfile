FROM debian:bullseye AS build

# Define the base workdir as /epanet
WORKDIR /epanet

# Install system dependencies
RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
    ca-certificates git build-essential cmake

# Clone EPASWMM source code for the specified version
RUN git clone -b v2.1.0 --depth 1 https://github.com/USEPA/epanet-solver .

# Change directory to the build/CMake folder
WORKDIR /epanet/build/CMake

# Run CMake to prepare a makefile
RUN cmake .

# Make the library and binary files
RUN make

# Get a fresh image
FROM debian:bullseye

# Copy library and binary files from build stage
COPY --from=build /epanet/build/CMake/bin/libENBinaryOut.so /usr/local/lib/libENBinaryOut.so
COPY --from=build /epanet/build/CMake/bin/libepanet.a /usr/local/lib/libepanet.a
COPY --from=build /epanet/build/CMake/bin/runepanet /usr/local/bin/runepanet

# Create sybmolic links for `runswmm` to commonly used binary names
RUN ln -s /usr/local/bin/runepanet /usr/local/bin/epanet

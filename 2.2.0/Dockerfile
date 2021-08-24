# syntax=docker/dockerfile:1.0

# Stage 1: Get EPANET source code

FROM alpine/git as clone
WORKDIR /epanet
RUN git clone https://github.com/NEERINC/EPANET . && git checkout v2.2.0

# Stage 2: Build EPANET source code

FROM gcc as build
WORKDIR /epanet
COPY --from=clone /epanet /epanet
RUN mkdir build && cd ./build && cp -R ../src . && cd ./src && \
    gcc -Wall main.c epanet.c epanet2.c input1.c input2.c input3.c rules.c \
    output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c \
    genmmd.c hydcoeffs.c hydsolver.c hydstatus.c project.c qualroute.c qualreact.c \
    -o ../epanet2.2.0 -lm

# Stage 3: Run EPANET simulation

FROM ubuntu
WORKDIR /epanet
COPY ./entrypoint.sh .
COPY --from=build /epanet/build/epanet2.2.0 .
RUN apt update && apt install -y wget
ENTRYPOINT [ "./entrypoint.sh" ]

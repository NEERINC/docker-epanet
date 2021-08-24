# syntax=docker/dockerfile:1.0

# Stage 1: Get EPANET source code

FROM alpine/git as clone
ARG EPANET_VERSION
ENV EPANET_VERSION=${EPANET_VERSION}
WORKDIR /epanet
RUN git clone https://github.com/NEERINC/EPANET . && git checkout v${EPANET_VERSION}

# Stage 2: Build EPANET source code

FROM gcc as build
ARG EPANET_VERSION
ENV EPANET_VERSION=${EPANET_VERSION}
WORKDIR /epanet
COPY --from=clone /epanet /epanet
RUN mkdir build && cd ./build && cp -R ../src . && cd ./src
RUN if [[ "${EPANET_VERSION}" == "2.0.11" ]] ; \
    then gcc -Wall epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o /epanet/build/epanet2.0.11 -lm ; \
    fi
RUN if [[ "${EPANET_VERSION}" == "2.0.12" ]] ; \
    then gcc -Wall epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o /epanet/build/epanet2.0.12 -lm ; \
    fi
RUN if [[ "${EPANET_VERSION}" == "2.1.0" ]] ; \
    then gcc -Wall main.c epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o /epanet/build/epanet2.1.0 -lm ; \
    fi
RUN if [[ "${EPANET_VERSION}" == "2.1.1" ]] ; \
    then gcc -Wall main.c epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o /epanet/build/epanet2.1.1 -lm ; \
    fi
RUN if [[ "${EPANET_VERSION}" == "2.2.0" ]] ; \
    then gcc -Wall main.c epanet.c epanet2.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c genmmd.c hydcoeffs.c hydsolver.c hydstatus.c project.c qualroute.c qualreact.c -o /epanet/build/epanet2.2.0 -lm ; \
    fi
RUN ls -al
RUN ls -al ./build
RUN ls -al ./build/src

# Stage 3: Run EPANET simulation

FROM ubuntu
ARG EPANET_VERSION
ENV EPANET_VERSION=${EPANET_VERSION}
WORKDIR /epanet
COPY ./entrypoint.sh .
COPY --from=build /epanet/build/epanet* .
RUN apt update && apt install -y wget
ENTRYPOINT [ "./entrypoint.sh" ]

# syntax=docker/dockerfile:1.0

FROM ubuntu

ARG EPANET_VERSION
ENV EPANET_VERSION=${EPANET_VERSION}

WORKDIR /epanet

RUN apt update && apt install -y git gcc wget

RUN git clone https://github.com/NEERINC/EPANET . && git checkout v${EPANET_VERSION}

RUN sed -i -e 's/#define DLL/\/\/#define DLL/' ./src/epanet.c && \
    sed -i -e 's/\/\/#define CLE/#define CLE/' ./src/epanet.c

RUN cd src && \
    if [ "${EPANET_VERSION}" = "2.0.11" ]; then \
        gcc -Wall epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o epanet2.0.11 -lm ; \
    elif [ "${EPANET_VERSION}" = "2.0.12" ]; then \
        gcc -Wall epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o epanet2.0.12 -lm ; \
    elif [ "${EPANET_VERSION}" = "2.1.0" ]; then \
        gcc -Wall main.c epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o epanet2.1.0 -lm ; \
    elif [ "${EPANET_VERSION}" = "2.1.1" ]; then \
        gcc -Wall main.c epanet.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c -o epanet2.1.1 -lm ; \
    elif [ "${EPANET_VERSION}" = "2.2.0" ]; then \
        gcc -Wall main.c epanet.c epanet2.c input1.c input2.c input3.c rules.c output.c report.c inpfile.c hydraul.c smatrix.c quality.c mempool.c hash.c genmmd.c hydcoeffs.c hydsolver.c hydstatus.c project.c qualroute.c qualreact.c -o epanet2.2.0 -lm ; \
    fi

RUN mv ./src/epanet${EPANET_VERSION} .

COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]

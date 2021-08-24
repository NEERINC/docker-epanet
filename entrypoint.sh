#!/bin/sh

wget -O epanet.inp ${INP_FILE_URL}

./epanet${EPANET_VERSION} epanet.inp epanet.rpt epanet.out;

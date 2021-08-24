#!/bin/sh

wget -O epanet.inp $INP_FILE_URL;

./epanet2.2.0 epanet.inp epanet.rpt epanet.out;

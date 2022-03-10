#!/usr/bin/env bash

docker pull neerteam/epanet:2.2.0
docker tag neerteam/epanet:2.2.0 neerteam/epanet:latest
docker push neerteam/epanet:latest

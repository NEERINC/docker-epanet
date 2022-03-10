#!/usr/bin/env bash

docker pull neerteam/epanet:2.1.0-bullseye-amd64-linux
docker tag neerteam/epanet:2.1.0-bullseye-amd64-linux neerteam/epanet:2.1.0
docker push neerteam/epanet:2.1.0

docker pull neerteam/epanet:2.1.1-bullseye-amd64-linux
docker tag neerteam/epanet:2.1.1-bullseye-amd64-linux neerteam/epanet:2.1.1
docker push neerteam/epanet:2.1.1

docker pull neerteam/epanet:2.2.0-bullseye-amd64-linux
docker tag neerteam/epanet:2.2.0-bullseye-amd64-linux neerteam/epanet:2.2.0
docker push neerteam/epanet:2.2.0

#!/usr/bin/env bash

# 2.1.0-alpine
docker manifest create --amend neerteam/epanet:2.1.0-alpine \
    neerteam/epanet:2.1.0-alpine-amd64-linux \
    neerteam/epanet:2.1.0-alpine-arm64-linux
docker manifest push neerteam/epanet:2.1.0-alpine

# 2.1.0-bullseye
docker manifest create --amend neerteam/epanet:2.1.0-bullseye \
    neerteam/epanet:2.1.0-bullseye-amd64-linux \
    neerteam/epanet:2.1.0-bullseye-arm64-linux
docker manifest push neerteam/epanet:2.1.0-bullseye

# 2.1.0-buster
docker manifest create --amend neerteam/epanet:2.1.0-buster \
    neerteam/epanet:2.1.0-buster-amd64-linux \
    neerteam/epanet:2.1.0-buster-arm64-linux
docker manifest push neerteam/epanet:2.1.0-buster

# 2.1.1-alpine
docker manifest create --amend neerteam/epanet:2.1.1-alpine \
    neerteam/epanet:2.1.1-alpine-amd64-linux \
    neerteam/epanet:2.1.1-alpine-arm64-linux
docker manifest push neerteam/epanet:2.1.1-alpine

# 2.1.1-bullseye
docker manifest create --amend neerteam/epanet:2.1.1-bullseye \
    neerteam/epanet:2.1.1-bullseye-amd64-linux \
    neerteam/epanet:2.1.1-bullseye-arm64-linux
docker manifest push neerteam/epanet:2.1.1-bullseye

# 2.1.1-buster
docker manifest create --amend neerteam/epanet:2.1.1-buster \
    neerteam/epanet:2.1.1-buster-amd64-linux \
    neerteam/epanet:2.1.1-buster-arm64-linux
docker manifest push neerteam/epanet:2.1.1-buster

# 2.2.0-alpine
docker manifest create --amend neerteam/epanet:2.2.0-alpine \
    neerteam/epanet:2.2.0-alpine-amd64-linux \
    neerteam/epanet:2.2.0-alpine-arm64-linux
docker manifest push neerteam/epanet:2.2.0-alpine

# 2.2.0-bullseye
docker manifest create --amend neerteam/epanet:2.2.0-bullseye \
    neerteam/epanet:2.2.0-bullseye-amd64-linux \
    neerteam/epanet:2.2.0-bullseye-arm64-linux
docker manifest push neerteam/epanet:2.2.0-bullseye

# 2.2.0-buster
docker manifest create --amend neerteam/epanet:2.2.0-buster \
    neerteam/epanet:2.2.0-buster-amd64-linux \
    neerteam/epanet:2.2.0-buster-arm64-linux
docker manifest push neerteam/epanet:2.2.0-buster

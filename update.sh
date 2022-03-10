#!/usr/bin/env bash

# 2.1.0
docker push $(VERSION=2.1.0 VARIANT=alpine ./build.sh)
docker push $(VERSION=2.1.0 VARIANT=bullseye ./build.sh)
docker push $(VERSION=2.1.0 VARIANT=buster ./build.sh)

# 2.1.1
docker push $(VERSION=2.1.1 VARIANT=alpine ./build.sh)
docker push $(VERSION=2.1.1 VARIANT=bullseye ./build.sh)
docker push $(VERSION=2.1.1 VARIANT=buster ./build.sh)

# 2.2.0
docker push $(VERSION=2.2.0 VARIANT=alpine ./build.sh)
docker push $(VERSION=2.2.0 VARIANT=bullseye ./build.sh)
docker push $(VERSION=2.2.0 VARIANT=buster ./build.sh)

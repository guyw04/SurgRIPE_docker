#!/usr/bin/env bash

echo "building surgripe:latest image"

docker build -t surgripe:latest -f Dockerfile .

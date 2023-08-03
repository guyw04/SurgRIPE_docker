#!/usr/bin/env bash

echo "building surgt:latest image"

docker build -t surgripe:latest -f Dockerfile .

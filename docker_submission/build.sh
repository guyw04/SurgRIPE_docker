#!/usr/bin/env bash

echo "building surgt:latest image"

docker build -t surgt:latest -f Dockerfile .
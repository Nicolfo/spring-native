#!/bin/bash

docker buildx build --platform linux/amd64,linux/arm64 \
  --build-arg PROJECT_NAME=demo \
  --tag harbor-sa2.tonicminds.com/public/spring-native:0.0.1 . --push

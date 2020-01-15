#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" = "true" ] || [ "$TRAVIS_BRANCH" != "master" ]; then
  docker buildx build \
    --progress plain \
    --platform=linux/amd64,linux/386,linux/arm/v7,linux/arm/v6,linux/arm64/v8 \
    .
  exit $?
fi
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin &> /dev/null
TAG="${TRAVIS_TAG:-latest}"
docker buildx build \
    --progress plain \
    --platform=linux/amd64,linux/386,linux/arm/v7,linux/arm/v6,linux/arm64/v8 \
    -t $REPO/$IMAGE_NAME:$TAG \
    --push \
    .

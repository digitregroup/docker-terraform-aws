#!/usr/bin/env bash

DOCKER_NAME="terraform-aws"
DOCKER_TAG="0.11.14"

docker build -t ${DOCKER_NAME} . && \
docker tag ${DOCKER_NAME} basile/${DOCKER_NAME}:${DOCKER_TAG} && \
docker tag ${DOCKER_NAME} basile/${DOCKER_NAME}:latest && \
docker push basile/${DOCKER_NAME}:${DOCKER_TAG} && \
docker push basile/${DOCKER_NAME}:latest

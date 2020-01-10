#!/usr/bin/env bash

source .env

docker build -t ${DOCKER_NAME} . && \
docker tag ${DOCKER_NAME} basile/${DOCKER_NAME}:${DOCKER_TAG} && \
docker tag ${DOCKER_NAME} basile/${DOCKER_NAME}:latest && \
docker push basile/${DOCKER_NAME}:${DOCKER_TAG} && \
docker push basile/${DOCKER_NAME}:latest

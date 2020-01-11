#!/usr/bin/env bash

source .env

docker tag ${DOCKER_NAME} ${DOCKER_IMAGE_PREFIX}/${DOCKER_NAME}:${DOCKER_TAG} && \
docker tag ${DOCKER_NAME} ${DOCKER_IMAGE_PREFIX}/${DOCKER_NAME}:latest && \
docker push ${DOCKER_IMAGE_PREFIX}/${DOCKER_NAME}:${DOCKER_TAG} && \
docker push ${DOCKER_IMAGE_PREFIX}/${DOCKER_NAME}:latest

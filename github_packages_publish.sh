#!/usr/bin/env bash

source .env

docker tag ${DOCKER_NAME} docker.pkg.github.com/${GITHUB_REPO}/${DOCKER_NAME}:${DOCKER_TAG} && \
docker tag ${DOCKER_NAME} docker.pkg.github.com/${GITHUB_REPO}/${DOCKER_NAME}:latest && \
docker push docker.pkg.github.com/${GITHUB_REPO}/${DOCKER_NAME}:${DOCKER_TAG} && \
docker push docker.pkg.github.com/${GITHUB_REPO}/${DOCKER_NAME}:latest

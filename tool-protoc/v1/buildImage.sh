#!/bin/bash -e

ENV=${ENV:-local}
REGISTRY_HOST=${REGISTRY_HOST:-"registry.ap-southeast-1.aliyuncs.com"}
REGISTRY_REPOSITORY=${REGISTRY_REPOSITORY:-"yhhnamespace/tool-protoc"}
IMAGE_NAME=${REGISTRY_HOST}/${REGISTRY_REPOSITORY}

buildImages() {
  imageNameWithTag=${IMAGE_NAME}:${ENV}
  docker build --build-arg REGISTRY_HOST=${REGISTRY_HOST} --build-arg ENV=${ENV} -t ${imageNameWithTag} .
  docker push ${imageNameWithTag}
}

buildImages

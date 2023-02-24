#!/bin/bash -e

ENV=${ENV:-local}
VERSIONS=${VERSIONS:-"1.13.4,1.19.3"}
VERSIONS=${VERSIONS//,/ }
REGISTRY_HOST=${REGISTRY_HOST:-"registry.ap-southeast-1.aliyuncs.com"}
REGISTRY_REPOSITORY=${REGISTRY_REPOSITORY:-"yhhnamespace/base-golang"}
IMAGE_NAME=${REGISTRY_HOST}/${REGISTRY_REPOSITORY}

buildImages() {
  for VERSION in ${VERSIONS}; do
    imageNameWithTag="${IMAGE_NAME}:${VERSION}-${ENV}"
    docker build --build-arg REGISTRY_HOST=${REGISTRY_HOST} --build-arg ENV=${ENV} --build-arg VERSION=${VERSION} \
      -t ${imageNameWithTag} .
    docker push ${imageNameWithTag}
  done
}

buildImages

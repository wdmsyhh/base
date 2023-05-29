#!/bin/bash -e

ENVS=${ENVS:-"local,staging,production"}
ENVS=${ENVS//,/ }
REGISTRY_HOST=${REGISTRY_HOST:-"registry.ap-southeast-1.aliyuncs.com"}
REGISTRY_REPOSITORY=${REGISTRY_REPOSITORY:-"yhhnamespace/base-ubuntu"}
IMAGE_NAME=${REGISTRY_HOST}/${REGISTRY_REPOSITORY}

buildImage() {
  imageNameWithTag=${IMAGE_NAME}:${ENV}
  docker build -t ${imageNameWithTag} .
  docker push ${imageNameWithTag}
}

for env in ${ENVS}; do
  export ENV=${env}
  buildImage
done

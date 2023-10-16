ARG REGISTRY_HOST
ARG ENV
FROM ${REGISTRY_HOST}/yhhnamespace/base-golang:1.19.3-${ENV}

# Protoc building used
ENV LD_LIBRARY_PATH /usr/local/lib

COPY bin /usr/local/bin/
COPY lib/ /usr/local/lib/
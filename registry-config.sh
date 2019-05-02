#!/usr/bin/env bash

# shellcheck disable=SC2034

# Fallback set container project to working directory
if [ -z "${CONTAINER_PROJECT}" ]; then
  CONTAINER_PROJECT="$(basename "$(pwd)")"
fi

# Container registry and tags
CONTAINER_REGISTRY="docker.io"
CONTAINER_REGISTRY_REPO="opennms"
CONTAINER_VERSION_TAGS=("${IMAGE_VERSION}"
                        "${VERSION}")

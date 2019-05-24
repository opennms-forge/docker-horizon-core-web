#!/bin/bash -e

# shellcheck disable=SC2034

# Overwrite project name on DockerHub
CONTAINER_PROJECT="horizon-core-web"

# Base Image Dependency
BASE_IMAGE="opennms/base-horizon"
BASE_IMAGE_VERSION="jdk11-1.0.0"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Horizon version
VERSION="24.1.0-confd"

# Docker Tags, use version by default
IMAGE_VERSION=("${VERSION}")

# Add Docker tag when build in CircleCI with build number
if [[ -n "${CIRCLE_BUILD_NUM}" ]]; then
  IMAGE_VERSION+=("${VERSION}-cb.${CIRCLE_BUILD_NUM}")
fi

#
# If you want to install packages from the official repository, add your packages here.
# By default the build system will build the RPMS in the ./rpms directory and install from here.
#
# Suggested packages to install OpenNMS Horizon packages from repository
#
ONMS_PACKAGES="opennms-core
               opennms-webapp-jetty
               opennms-webapp-hawtio
               opennms-plugin-protocol-cifs"

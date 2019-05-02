#!/bin/bash -e

# shellcheck source=config.sh
source ./config.sh

# shellcheck source=registry-config.sh
source ./registry-config.sh

if [[ -d images ]]; then
  rm -rf images/*
fi

docker build -t "${CONTAINER_PROJECT}" \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg PACKAGES="${PACKAGES}" \
  --build-arg ONMS_PACKAGES="${ONMS_PACKAGES}" \
  .

docker image save "${CONTAINER_PROJECT}" -o images/horizon-core-web.oci

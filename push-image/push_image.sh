#!/bin/env bash

set -e

test NAME
test DOCKER_REPO
test MOZ_FETCHES_DIR
test VCS_HEAD_REV
test VCS_HEAD_REPOSITORY

echo "=== Generating dockercfg ==="

PASSWORD_URL="http://taskcluster/secrets/v1/secret/github_deploy"
install -m 600 /dev/null ${HOME}/.dockercfg
curl ${PASSWORD_URL} | jq '.secret.dockercfg' > ${HOME}/.dockercfg
export REGISTRY_AUTH_FILE=$HOME/.dockercfg

echo "=== Preparing docker image ==="

cd $MOZ_FETCHES_DIR
unzstd image.tar.zst

# Create an OCI copy of image in order umoci can patch it
skopeo copy docker-archive:image.tar oci:${NAME}:final

cat > version.json <<EOF
{
    "commit": "${VCS_HEAD_REV}",
    "source": "${VCS_HEAD_REPOSITORY}",
    "build": "${TASKCLUSTER_ROOT_URL}/tasks/${TASK_ID}"
}
EOF
DOCKER_TAG=${VCS_HEAD_REV}

umoci insert --image ${NAME}:final version.json /version.json

echo "=== Pushing image ==="

skopeo copy oci:${NAME}:final docker://$DOCKER_REPO:$DOCKER_TAG
skopeo copy oci:${NAME}:final docker://$DOCKER_REPO:latest

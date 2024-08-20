#!/bin/env bash

set -e

test $NAME
test $DOCKER_REPO
test $VCS_HEAD_REV
test $VCS_HEAD_REPOSITORY

echo "=== Generating dockercfg ==="

PASSWORD_URL="http://taskcluster/secrets/v1/secret/github_deploy"
install -m 600 /dev/null ${HOME}/.dockercfg
curl ${PASSWORD_URL} | jq -r '.secret.dockercfg' > ${HOME}/.dockercfg
export REGISTRY_AUTH_FILE=$HOME/.dockercfg

echo "=== Preparing docker image ==="

cp -R $MOZ_FETCHES_DIR/* $VCS_PATH/taskcluster/docker/${NAME}
cd $VCS_PATH/taskcluster/docker/${NAME} && podman build -t oci:${NAME}:final .

cat > version.json <<EOF
{
    "commit": "${VCS_HEAD_REV}",
    "source": "${VCS_HEAD_REPOSITORY}",
    "build": "${TASKCLUSTER_ROOT_URL}/tasks/${TASK_ID}"
}
EOF
COMMIT_COUNT=$(cd $VCS_PATH && git rev-list refs/heads/${VCS_HEAD_REF} --count)
DOCKER_TAG=${VCS_HEAD_REF}-${COMMIT_COUNT}

umoci insert --image ${NAME}:final version.json /version.json

echo "=== Pushing image ==="

skopeo copy oci:${NAME}:final docker://$DOCKER_REPO:$DOCKER_TAG


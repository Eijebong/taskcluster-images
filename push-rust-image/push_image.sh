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

buildah build --network=host -f "$VCS_PATH/taskcluster/docker/${NAME}/Dockerfile" -t ${NAME}:final "$VCS_PATH/taskcluster/docker/${NAME}"
buildah push ${NAME}:final oci:${NAME}:final

cat > version.json <<EOF
{
    "commit": "${VCS_HEAD_REV}",
    "source": "${VCS_HEAD_REPOSITORY}",
    "build": "${TASKCLUSTER_ROOT_URL}/tasks/${TASK_ID}"
}
EOF
COMMIT_COUNT=$(cd $VCS_PATH && git rev-list HEAD --count)
DOCKER_TAG=${VCS_HEAD_REF}-${COMMIT_COUNT}

umoci insert --image ${NAME}:final version.json /version.json

echo "=== Pushing image ==="

skopeo copy oci:${NAME}:final docker://$DOCKER_REPO:$DOCKER_TAG
if [[ "${VCS_HEAD_REF}" == "main" ]]; then
    skopeo copy oci:${NAME}:final docker://$DOCKER_REPO:latest
fi


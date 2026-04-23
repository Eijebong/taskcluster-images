#!/usr/bin/env bash
set -e

test "$NAME"
test "$DOCKER_REPO"
test "$VCS_HEAD_REV"
test "$VCS_HEAD_REPOSITORY"

echo "=== Generating docker config ==="
PASSWORD_URL="http://taskcluster/secrets/v1/secret/github_deploy"
mkdir -p /kaniko/.docker

curl -s "${PASSWORD_URL}" | jq '.secret.dockercfg | if has("auths") then . else {auths: .} end' > /kaniko/.docker/config.json
chmod 600 /kaniko/.docker/config.json

echo "=== Preparing build context ==="
CONTEXT="$VCS_PATH/taskcluster/docker/${NAME}"
cp -R "$MOZ_FETCHES_DIR"/* "$CONTEXT"

echo "=== Building and pushing ==="
COMMIT_COUNT=$(cd "$VCS_PATH" && git rev-list HEAD --count)
DOCKER_TAG="${VCS_HEAD_REF}-${COMMIT_COUNT}"

DESTS=("--destination=${DOCKER_REPO}:${DOCKER_TAG}")
if [[ "${VCS_HEAD_REF}" == "main" ]]; then
  DESTS+=("--destination=${DOCKER_REPO}:latest")
fi

/kaniko/executor \
  --context="$CONTEXT" \
  --dockerfile="$CONTEXT/Dockerfile" \
  "${DESTS[@]}"

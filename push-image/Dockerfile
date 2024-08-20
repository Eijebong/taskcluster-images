FROM mozillareleases/image_builder:5.1.0 AS image_builder

FROM alpine:latest

RUN apk update && apk add --no-cache skopeo umoci bash coreutils python3 curl jq zstd git openssh-client
COPY push_image.sh /usr/local/bin/push_image.sh

COPY run-task/run-task /usr/local/bin/run-task
COPY run-task/fetch-content /usr/local/bin/fetch-content
COPY run-task/robustcheckout.py /usr/local/mercurial/robustcheckout.py
COPY run-task/hgrc /etc/mercurial/hgrc.d/mozilla.rc

RUN mkdir /kaniko-bootstrap

COPY --from=image_builder --chmod=0755 /kaniko-bootstrap/skopeo /kaniko-bootstrap/skopeo
COPY --from=image_builder --chmod=0755 /kaniko-bootstrap/executor /kaniko-bootstrap/executor
COPY --from=image_builder --chmod=0755 /kaniko-bootstrap/build-image /kaniko-bootstrap/build-image
COPY --from=image_builder /kaniko-bootstrap/containers/policy.json /kaniko-bootstrap/containers/policy.json

# Add worker user
RUN mkdir /builds && \
    addgroup -g 1000 worker && \
    adduser -h /builds/worker -s /bin/bash -D worker -G worker -u 1000 && \
    mkdir /builds/worker/artifacts /workspace && \
    chown worker:worker /builds/worker/artifacts /workspace

ENV SHELL=/bin/bash \
    HOME=/builds/worker \
    USER=worker \
    PATH=/usr/local/bin:/kaniko:/bin:/usr/bin

WORKDIR /workspace

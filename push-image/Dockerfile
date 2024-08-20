FROM alpine:latest

RUN apk update && apk add --no-cache skopeo umoci bash coreutils python3 curl jq zstd git openssh-client podman
COPY push_image.sh /usr/local/bin/push_image.sh

COPY run-task/run-task /usr/local/bin/run-task
COPY run-task/fetch-content /usr/local/bin/fetch-content
COPY run-task/robustcheckout.py /usr/local/mercurial/robustcheckout.py
COPY run-task/hgrc /etc/mercurial/hgrc.d/mozilla.rc

# Add worker user
RUN mkdir /builds && \
    addgroup -g 1000 worker && \
    adduser -h /builds/worker -s /bin/bash -D worker -G worker -u 1000 && \
    mkdir /builds/worker/artifacts /workspace && \
    chown worker:worker /builds/worker/artifacts /workspace

RUN echo "worker:100000:65536" > /etc/subuid
RUN echo "worker:100000:65536" > /etc/subgid

ENV SHELL=/bin/bash \
    HOME=/builds/worker \
    USER=worker

VOLUME /var/lib/containers

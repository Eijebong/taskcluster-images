FROM alpine:latest

RUN apk update && apk add --no-cache skopeo umoci bash coreutils python3 curl jq zstd git openssh-client podman
COPY push_image.sh /usr/local/bin/push_image.sh

COPY run-task/run-task /usr/local/bin/run-task
COPY run-task/fetch-content /usr/local/bin/fetch-content
COPY run-task/robustcheckout.py /usr/local/mercurial/robustcheckout.py
COPY run-task/hgrc /etc/mercurial/hgrc.d/mozilla.rc

RUN usermod --add-subuids 10000-75535 root
RUN usermod --add-subgids 10000-75535 root

VOLUME /var/lib/containers

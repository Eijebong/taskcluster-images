FROM alpine:latest

RUN apk update && apk add --no-cache skopeo umoci bash coreutils
COPY push_image.sh /usr/local/bin/push_image.sh

COPY run-task/run-task /usr/local/bin/run-task
COPY run-task/fetch-content /usr/local/bin/fetch-content
COPY run-task/robustcheckout.py /usr/local/mercurial/robustcheckout.py
COPY run-task/hgrc /etc/mercurial/hgrc.d/mozilla.rc

FROM alpine:latest

RUN apk update && apk add --no-cache skopeo umoci bash
COPY push_image.sh /usr/local/bin/push_image.sh

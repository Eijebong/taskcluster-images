FROM mozillareleases/taskgraph:decision-v9.2.0
LABEL org.opencontainers.image.source https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client

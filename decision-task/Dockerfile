FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#92d8789ee7714a7149dffb98c80c2fffb8ad1e6e
RUN pip install --break-system-packages toml

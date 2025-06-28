FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#1faf01fad92b6c7446fe4a667efb59c6d135c73d
RUN pip install --break-system-packages toml

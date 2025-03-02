FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=c33df7e58835088d7bd3835927c5326fd46d854c
RUN pip install --break-system-packages toml

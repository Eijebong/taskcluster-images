FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#a909bcaac5dfb85360e48598cdf9158c1297651b
RUN pip install --break-system-packages toml

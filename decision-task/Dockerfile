FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#a2c83e4ad0b94a8e5b23eb254bb3d6ffaa9bbd7a
RUN pip install --break-system-packages toml

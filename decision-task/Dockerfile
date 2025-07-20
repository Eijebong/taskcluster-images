FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#28f341f33c9bb5df043546fe118aad5544e66698
RUN pip install --break-system-packages toml

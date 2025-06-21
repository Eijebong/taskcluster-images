FROM mozillareleases/taskgraph:decision-v14.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#09f87f9573f041d4c6f21151436196a39acc01c0
RUN pip install --break-system-packages toml

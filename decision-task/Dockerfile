FROM mozillareleases/taskgraph:decision-v9.2.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=9c40315cf6c71e1eb5fce95eb8152f30285c8fb0

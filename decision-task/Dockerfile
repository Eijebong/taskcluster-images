FROM mozillareleases/taskgraph:decision-v10.0.2
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=3f011a1b7293fb1ee821b3dd767aa0400b34bf02

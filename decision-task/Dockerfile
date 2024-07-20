FROM mozillareleases/taskgraph:decision-v9.2.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=fbd70d5ba0017213fe584182bd67f28b573467a1

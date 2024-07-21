FROM mozillareleases/taskgraph:decision-v9.2.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=e161150d51a3e2de7acca11c674c8dd9765a1af9

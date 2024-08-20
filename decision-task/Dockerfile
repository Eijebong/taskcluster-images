FROM mozillareleases/taskgraph:decision-v10.0.2
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=9c900b64667170a7a307395e86fafbf12b1df941

FROM mozillareleases/taskgraph:decision-v10.0.2
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=d499f300f7822085f886c94c23a57d45aeb7975a

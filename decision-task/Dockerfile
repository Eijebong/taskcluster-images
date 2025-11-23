FROM mozillareleases/taskgraph:decision-v17.3.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq

# XXX: Uncomment to test taskgraph versions, it'll override whatever is in the decision task image
# RUN pip install --break-system-packages -e git+https://github.com/Eijebong/taskgraph@910e15ff6734d1023027539b78275c9d195fd722#egg=taskcluster-taskgraph
# RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/run-task /usr/local/bin/run-task
# RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/fetch-content /usr/local/bin/fetch-content

RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#2dec672b05b8bd1dddcab6f603512707fef2dec5
RUN pip install --break-system-packages toml

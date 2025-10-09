FROM mozillareleases/taskgraph:decision-v16.1.1
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq

# XXX: This is to test some taskgraph stuff, remove once it's tested
RUN pip install --break-system-packages -e git+https://github.com/Eijebong/taskgraph@1c580521aae08131f05b53856211e0aef515aff5#egg=taskcluster-taskgraph
RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/run-task /usr/local/bin/run-task
RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/fetch-content /usr/local/bin/fetch-content

RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#28f341f33c9bb5df043546fe118aad5544e66698
RUN pip install --break-system-packages toml

FROM mozillareleases/taskgraph:decision-v16.2.1
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq

# XXX: Uncomment to test taskgraph versions, it'll override whatever is in the decision task image
RUN pip install --break-system-packages -e git+https://github.com/Eijebong/taskgraph@e1a404dae54afacb37eacef55a28b9802187c1bd#egg=taskcluster-taskgraph
RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/run-task /usr/local/bin/run-task
RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/fetch-content /usr/local/bin/fetch-content

RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#28f341f33c9bb5df043546fe118aad5544e66698
RUN pip install --break-system-packages toml

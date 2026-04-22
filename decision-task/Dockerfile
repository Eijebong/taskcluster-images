FROM mozillareleases/taskgraph:decision-v20.0.0
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client jq

# XXX: Uncomment to test taskgraph versions, it'll override whatever is in the decision task image
 RUN pip install --break-system-packages -e git+https://github.com/Eijebong/taskgraph@cd9edd80325090ffafd76d299856cb6bc30dc88f#egg=taskcluster-taskgraph
 RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/run-task /usr/local/bin/run-task
 RUN cp /src/taskcluster-taskgraph/src/taskgraph/run-task/fetch-content /usr/local/bin/fetch-content

RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#47b0f74222ead41ea3938b27d1f80033e1e9d92e
RUN pip install --break-system-packages toml semver

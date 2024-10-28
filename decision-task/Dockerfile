FROM mozillareleases/taskgraph:decision-v10.0.2
LABEL org.opencontainers.image.source=https://github.com/eijebong/taskcluster-decision-task-image

RUN apt update && apt install -y openssh-client
RUN pip install --break-system-packages git+https://github.com/Eijebong/taskgraph#commit=63e2e3ebb8d7559411adc0cff998518fa0bca013
RUN cp /usr/local/lib/python3.11/dist-packages/taskgraph/run-task/run-task /usr/local/bin/run-task
RUN cp /usr/local/lib/python3.11/dist-packages/taskgraph/run-task/fetch-content /usr/local/bin/fetch-content
RUN pip install --break-system-packages git+https://github.com/Eijebong/eije-taskgraph#commit=8c3b6a53a5875b6e60c572357f1f0bcf47d9978c
RUN pip install --break-system-packages toml

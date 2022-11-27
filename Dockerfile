# wfmash Dockerfile
FROM mambaorg/micromamba:1.0.0-bullseye-slim
MAINTAINER Juan Manuel Vazquez <juan@vazquez.bio>

#ADD https://raw.githubusercontent.com/mamba-org/micromamba-docker/main/examples/yaml_spec/env.yaml /tmp/env.yaml
#RUN chown $MAMBA_USER:$MAMBA_USER /tmp/env.yaml

COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml

RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes
#    micromamba install -c conda-forge -c bioconda wfmash && \


SHELL ["/bin/bash", "-c"]
CMD wfmash

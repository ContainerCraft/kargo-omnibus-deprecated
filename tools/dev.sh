#!/bin/bash
project="kargo-dev"

sudo rm -rf /tmp/.ssh
sudo cp -rf ~/.ssh /tmp/

sudo podman pull docker.io/cloudctl/konductor

sudo podman run -it --rm \
    --entrypoint bash                               \
    -h ${project} --name ${project}                 \
    --volume /tmp/.ssh:/root/.ssh:z                 \
    --workdir /root/platform/iac/${project}         \
    --volume $(pwd):/root/platform/iac/${project}:z \
  docker.io/cloudctl/konductor $@

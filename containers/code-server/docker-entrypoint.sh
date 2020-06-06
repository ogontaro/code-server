#!/bin/bash

sudo chown coder:coder /var/run/docker.sock
sudo chown coder:coder ${PROJECTS_PATH}
ln -s ${PROJECTS_PATH} ./projects

exec dumb-init fixuid -q /usr/bin/code-server --bind-addr 0.0.0.0:8080 . "$@"

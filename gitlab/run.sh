#!/bin/bash

export GITLAB_HOME=/mnt/hdd/gitlab

docker run \
    --detach \
    --hostname gitlab.iotree.co.kr \
    --publish 11080:80 \
    --publish 11443:443 \
    --name gitlab \
    --restart always \
    --volume $GITLAB_HOME/config:/etc/gitlab \
    --volume $GITLAB_HOME/logs:/var/log/gitlab \
    --volume $GITLAB_HOME/data:/var/opt/gitlab \
    --shm-size 256m \
    --log-opt max-size=20m \
    --log-opt max-file=10 \
    gitlab/gitlab-ce:latest
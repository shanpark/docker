#!/bin/bash

docker run \
	-d \
	--rm \
	--name jenkins \
	-p 80:8080 \
	-p 50000:50000 \
	-v $PWD/jenkins_home:/var/jenkins_home \
	--log-opt max-size=20m \
	--log-opt max-file=10 \
	jenkins/jenkins:lts

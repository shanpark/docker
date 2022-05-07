#!/bin/bash

docker run \
	-d \
	--rm \
	--name jenkins \
	-p 80:8080 \
	-p 50000:50000 \
	-v $PWD/jenkins_home:/var/jenkins_home \
	jenkins/jenkins:lts

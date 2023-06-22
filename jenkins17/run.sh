#!/bin/bash

sudo docker run -d \
	--name jenkins17 \
	-p 80:8080 \
	-p 50000:50000 \
	-v $PWD/data:/var/jenkins_home \
        jenkins/jenkins:lts-jdk17

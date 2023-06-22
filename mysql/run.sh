#!/bin/bash

docker run \
	-d \
	--rm \
	--name mysql \
	-p 3308:3306 \
	-e MYSQL_ROOT_PASSWORD=#RootPassword# \
	-v $PWD/data:/var/lib/mysql \
	--log-opt max-size=20m \
	--log-opt max-file=10 \
	mysql:latest

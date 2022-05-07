#!/bin/bash

docker run \
	-d \
	--rm \
	--name mariadb \
	-p 13306:3306 \
	-v $PWD/data:/var/lib/mysql \
	-e MARIADB_USER=UserID \
	-e MARIADB_PASSWORD=UserPW \
	-e MARIADB_ROOT_PASSWORD=RootPW \
	mariadb:latest

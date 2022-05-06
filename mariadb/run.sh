#!/bin/bash

docker run \
	-d \
	--rm \
	--name mariadb \
	-p 3307:3306 \
	-v /home/shanpark/mariadb/data:/var/lib/mysql \
	-e MARIADB_USER=dbadmin \
	-e MARIADB_PASSWORD=Maria1234!@#$ \
	-e MARIADB_ROOT_PASSWORD=Maria1234!@#$ \
	mariadb:latest

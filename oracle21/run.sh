#!/bin/bash

docker run \
        -d \
        --rm \
        --name oracle21 \
        -p 1521:1521 \
        -e ORACLE_PASSWORD=Iotree123!@# \
        -v /mnt/hdd/oracle21-data:/opt/oracle/oradata \
        gvenzl/oracle-xe:21
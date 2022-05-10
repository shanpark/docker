#!/bin/bash

docker exec mariadb sh -c 'exec mysqldump --all-databases -uroot -p"RootPW"' > all-databases.sql

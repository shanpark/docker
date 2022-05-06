#!/bin/bash

docker exec mariadb sh -c 'exec mysqldump --all-databases -uroot -p"Maria1234!@#$"' > all-databases.sql

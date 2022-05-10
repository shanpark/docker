#!/bin/bash

docker exec -i mariadb sh -c 'exec mysql -uroot -p"RootPW"' < all-databases.sql

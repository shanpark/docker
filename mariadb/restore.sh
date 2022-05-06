#!/bin/bash

docker exec -i mariadb sh -c 'exec mysql -uroot -p"Maria1234!@#$"' < all-databases.sql

#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: sudo ./restore.sh [path of backup file]"
    exit
fi

while true; do
    read -p "> Do you wish to restore '$1'? [y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "> Please answer y or n.";;
    esac
done

echo "Data restoring takes long time(a few minutes...)."
docker exec -i mysql sh -c 'exec mysql -uroot -p"#RootPassword#"' < $1

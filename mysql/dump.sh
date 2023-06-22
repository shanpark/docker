#!/bin/bash

WORK_DIR="/home/shpark/mysql"
BACKUP_NAME="mysql-all-databases_$(date '+%Y%m%d').sql"
BACKUP_DIR="/home/shpark/mysql/backup"
BACKUP_NAS_DIR="/mnt/backup_nas/mysql"

cd ${WORK_DIR}

echo "> Creating dump file... [${BACKUP_NAME}]"
docker exec mysql sh -c 'exec mysqldump --all-databases -uroot -p"#RootPassword#"' > ${BACKUP_NAME}

echo "> Archiving dump file... [${BACKUP_NAME}.tar.gz]"
tar -cvzf ${BACKUP_NAME}.tar.gz ${BACKUP_NAME}

echo "> Moving archive file to '${BACKUP_DIR}' ..."
mv ${BACKUP_NAME}.tar.gz ${BACKUP_DIR} 1>/dev/null 2>&1
cp ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz ${BACKUP_NAS_DIR}

echo "> ${BACKUP_NAME} deleted."
rm ${BACKUP_NAME}

echo "> Deleting old backup files..."
find ${BACKUP_DIR} -type f -mtime +10 -delete
find ${BACKUP_NAS_DIR} -type f -mtime +30 -delete

echo "> Backup process completed."

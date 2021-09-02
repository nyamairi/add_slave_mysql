#!/bin/sh

mysqldump -h $MASTER_HOST -u $MASTER_USER -p$MASTER_PASSWORD --master-data --all-databases > /tmp/master.dump

until mysql -u root -p$MYSQL_ROOT_PASSWORD -e ''; do
  echo -n .
  sleep 1
done

mysql -u root -p$MYSQL_ROOT_PASSWORD -e 'STOP SLAVE'
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CHANGE MASTER TO MASTER_HOST = '$MASTER_HOST', MASTER_USER = '$MASTER_USER', MASTER_PASSWORD = '$MASTER_PASSWORD'"
mysql -u root -p$MYSQL_ROOT_PASSWORD < /tmp/master.dump
mysql -u root -p$MYSQL_ROOT_PASSWORD -e 'START SLAVE'

rm /tmp/master.dump

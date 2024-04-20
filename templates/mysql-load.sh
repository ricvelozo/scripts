#!/bin/sh
host='localhost'
unzstd < backup.sql.zst | mysql -h $host -u root -p

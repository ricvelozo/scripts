#!/bin/sh
host='localhost'
gunzip < backup.sql.gz | mysql -h $host -u root -p

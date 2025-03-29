#!/bin/sh
host='localhost'
port=3306
unzstd -c < $1 | mysql -h $host -P $port -u root -p

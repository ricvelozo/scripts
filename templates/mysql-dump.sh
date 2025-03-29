#!/bin/sh
host='localhost'
port=3306
mysqldump -h $host -P $port -u root -p --all-databases | zstd -T0 > \
    ${host}_$(date +\%Y-\%m-\%d_%H-%M-%S).sql.zst

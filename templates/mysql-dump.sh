#!/bin/sh
host='localhost'
mysqldump -h $host -u root -p --all-databases | zstd -T0 > \
    ${host}_$(date +\%Y-\%m-\%d_%H-%M-%S).sql.zst

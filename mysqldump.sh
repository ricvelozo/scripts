#!/bin/sh
host="localhost"
mysqldump -h $host -u root -p --all-databases | gzip > \
    ${host}_$(date +\%Y-\%m-\%d_%H-%M-%S).sql.gz

#!/bin/sh
host='localhost'
port=5432
pg_dumpall -h $host -U postgres -p $port -W | zstd -T0 > \
    ${host}_$(date +\%Y-\%m-\%d_%H-%M-%S).sql.zst

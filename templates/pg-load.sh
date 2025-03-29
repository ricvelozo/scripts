#!/bin/sh
host='localhost'
port=5432
unzstd -c < $1 | psql -X -h $host -U postgres -p $port -W

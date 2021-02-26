#!/bin/sh
tar -c directory/ | gzip > backup_$(date +\%Y-\%m-\%d_%H-%M-%S).tar.gz

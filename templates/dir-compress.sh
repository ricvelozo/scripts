#!/bin/sh
tar -c directory/ | zstd -19 -T0 > backup_$(date +\%Y-\%m-\%d_%H-%M-%S).tar.zst

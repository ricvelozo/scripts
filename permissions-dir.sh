#!/bin/sh

# Set permissions 755 for directories, and 664 for files, recursively
# Source: http://superuser.com/a/51873
find . \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 664 {} \; \)

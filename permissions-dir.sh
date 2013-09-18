#!/bin/bash

# Set permissions 775 for direcories, and 664 for files, recursively
# Source: http://superuser.com/a/51873
find . \( -type d -exec chmod 775 {} \; \) -o \( -type f -exec chmod 664 {} \; \)

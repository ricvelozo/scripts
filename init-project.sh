#!/bin/sh

# Get the current Templates directory
templates="$(xdg-user-dir TEMPLATES)"

# Copy README* and LICENSE* template(s), if any
find $templates \( -name 'README*' -o -name 'LICENSE*' \) -exec cp -n {} ./ \;

# Make the basic directory structure
mkdir -p build-aux data docs examples include po src tests

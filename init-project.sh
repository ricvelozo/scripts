#!/bin/sh

# Get the current Templates directory
templates_dir="$(xdg-user-dir TEMPLATES)"

# Copy README* template(s), if any
if [ $(ls "$templates_dir/README"* 2> /dev/null | wc -l) != "0" ]
    then cp -n -r -T "$templates_dir/README"* ./
fi

# Make the basic directory structure
mkdir -p build-aux data docs examples include po src tests

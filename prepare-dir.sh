#!/bin/bash

# Make the basic directory structure
mkdir -p bin doc examples include lib src test

# Get the user directories
cat ~/.config/user-dirs.dirs | while read line; do
    if [ "${line:0:17}" = "XDG_TEMPLATES_DIR" ]; then
        # Get the current Templates directory
        eval templates_dir="${line:19:-1}"

        # Copy README* template(s), if any
        if [ $(ls "$templates_dir/README"* 2> /dev/null | wc -l) != "0" ]
            then cp -n -r -T "$templates_dir/README"* ./
        fi
    fi
done

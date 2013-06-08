#!/bin/bash

# Add an empty .gitignore file in that directory there are no files
# Source: http://stackoverflow.com/a/5871742
find . -type d -empty -exec touch {}/.gitignore \;

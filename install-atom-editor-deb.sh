#!/bin/bash
# Install or update Atom Editor with favorite packages
cd /tmp && wget https://atom.io/download/deb -O atom-editor.deb &&
sudo dpkg -i ./atom-editor.deb && apm install sublime-style-column-selection \
color-picker emmet file-icons language-vue linter linter-eslint linter-php \
minimap

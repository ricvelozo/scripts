#!/bin/sh
# Installs or updates the Atom Editor (.deb) with favorite packages
cd /tmp && wget https://atom.io/download/deb -O atom-editor.deb &&
sudo dpkg -i ./atom-editor.deb && apm install atom-ide-ui ide-css ide-php \
ide-rust ide-typescript ide-vue language-vue emmet color-picker file-icons \
minimap sublime-style-column-selection

#!/bin/sh
# Installs or updates the Atom Editor (.rpm) with favorite packages
cd /tmp && sudo wget -c https://atom.io/download/rpm -O atom-editor.rpm &&
sudo dnf install ./atom-editor.rpm && apm install atom-ide-ui ide-css ide-php \
ide-rust ide-typescript ide-vue language-vue emmet color-picker file-icons \
minimap sublime-style-column-selection

#!/bin/sh
# Installs the Atom Editor (Flatpak) with favorite packages
flatpak remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo && flatpak install flathub \
io.atom.Atom && flatpak run --command=apm io.atom.Atom install atom-ide-ui \
ide-css ide-php ide-rust ide-typescript ide-vue language-vue emmet \
color-picker file-icons minimap sublime-style-column-selection

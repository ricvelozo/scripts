#!/bin/sh
flatpak remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo && flatpak install flathub \
com.visualstudio.code.oss && flatpak run com.visualstudio.code.oss \
--install-extension ms-ceintl.vscode-language-pack-pt-br \
--install-extension pkief.material-icon-theme \
--install-extension equinusocio.vsc-material-theme \
--install-extension ms-python.python \
--install-extension dbaeumer.vscode-eslint \
--install-extension octref.vetur \
--install-extension PeterJausovec.vscode-docker \
--install-extension rust-lang.rust

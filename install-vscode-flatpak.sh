#!/bin/sh
# Installs the Visual Studio Code (Flatpak) with favorite packages
flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo && \
flatpak install --system flathub com.visualstudio.code && \
flatpak run com.visualstudio.code \
--install-extension zhuangtongfa.material-theme \
--install-extension pkief.material-icon-theme \
--install-extension EditorConfig.EditorConfig \
--install-extension yzhang.markdown-all-in-one \
--install-extension dotjoshjohnson.xml \
--install-extension formulahendry.auto-close-tag \
--install-extension formulahendry.auto-rename-tag \
--install-extension pucelle.vscode-css-navigation \
--install-extension mrmlnc.vscode-scss \
--install-extension dbaeumer.vscode-eslint \
--install-extension octref.vetur \
--install-extension bmewburn.vscode-intelephense-client \
--install-extension ms-python.python \
--install-extension rust-lang.rust \
--install-extension bungcip.better-toml \
--install-extension geequlim.godot-tools

# settings.json:
# {
#     "window.menuBarVisibility": "toggle",
#     "workbench.colorTheme": "One Dark Pro",
#     "workbench.iconTheme": "material-icon-theme",
#     "editor.rulers": [
#         80,
#         100
#     ],
#     "files.insertFinalNewline": true,
#     "files.watcherExclude": {
#         "**/target/**": true
#     },
#     "eslint.nodePath": "/home/ricardo/flatpak-nodejs",
#     "php.validate.executablePath": "/home/ricardo/flatpak-php",
#     "rust-client.rustupPath": "/home/ricardo/.cargo/bin/rustup",
#     "telemetry.enableTelemetry": false
# }

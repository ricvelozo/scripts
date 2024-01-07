#!/bin/sh
# Installs the Visual Studio Code (Flatpak) with favorite packages
flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo && \
flatpak install --system flathub com.visualstudio.code && \
flatpak run com.visualstudio.code \
--install-extension GitHub.github-vscode-theme \
--install-extension pkief.material-icon-theme \
--install-extension EditorConfig.EditorConfig \
--install-extension yzhang.markdown-all-in-one \
--install-extension redhat.vscode-xml \
--install-extension esbenp.prettier-vscode \
--install-extension bradlc.vscode-tailwindcss \
--install-extension dbaeumer.vscode-eslint \
--install-extension svelte.svelte-vscode \
--install-extension Vue.volar \
--install-extension Vue.vscode-typescript-vue-plugin \
--install-extension bmewburn.vscode-intelephense-client \
--install-extension rust-lang.rust-analyzer \
--install-extension tamasfe.even-better-toml \
--install-extension ms-vscode.cpptools \
--install-extension ms-dotnettools.csharp \
--install-extension ms-python.python \
--install-extension ms-python.vscode-pylance \
--install-extension samuelcolvin.jinjahtml \
--install-extension sumneko.lua \
--install-extension Dart-Code.flutter \
--install-extension geequlim.godot-tools \
--install-extension ms-azuretools.vscode-docker \
--install-extension ms-vscode-remote.remote-containers \
--install-extension bilelmoussaoui.flatpak-vscode

# settings.json:
# {
#     "window.menuBarVisibility": "toggle",
#     "window.restoreWindows": "none",
#     "workbench.colorTheme": "GitHub Dark",
#     "workbench.iconTheme": "material-icon-theme",
#     "editor.inlayHints.enabled": "offUnlessPressed",
#     "editor.rulers": [
#         80,
#         100
#     ],
#     "files.insertFinalNewline": true,
#     "files.watcherExclude": {
#         "**/target/**": true
#     },
#     "telemetry.telemetryLevel": "off"
# }

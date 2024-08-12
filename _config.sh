#!/bin/bash

WORKING_DIR=Workspace # ~/Workspace

EMAIL=thangtc.work@gmail.com

GIT_CONFIG=(
    "user.name tran-chien-thang"
    "user.email $EMAIL"
)

BREW_FORMULA=(
    ffmpeg
)

BREW_CASK=(
    # --- Productivity ---
    1password
    # rectangle
    # microsoft-word
    # microsoft-excel
    # microsoft-powerpoint

    # --- Development ---
    visual-studio-code
    jetbrains-toolbox
    # figma
    postman
    iterm2
    # sublime-text

    # --- Browser ---
    # brave-browser
    microsoft-edge
    google-chrome
    # firefox

    # --- Other ---
    font-jetbrains-mono-nerd-font
    # discord
    # slack
    zoom
    webex
    # spotify
    # signal
    # vlc
)

VSCODE_EXTENSIONS=(
    aaron-bond.better-comments
    adpyke.codesnap
    christian-kohler.path-intellisense
    dbaeumer.vscode-eslint
    # eamodio.gitlens
    editorconfig.editorconfig
    esbenp.prettier-vscode
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
    foxundermoon.shell-format
    # github.copilot
    # github.copilot-chat
    jock.svg
    # ms-azuretools.vscode-docker
    ms-python.python
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    ms-vscode.cpptools-themes
    pkief.material-icon-theme
    ritwickdey.liveserver
    visualstudioexptteam.intellicode-api-usage-examples
    visualstudioexptteam.vscodeintellicode
    vue.volar
    wakatime.vscode-wakatime
    # xabikos.javascriptsnippets
)

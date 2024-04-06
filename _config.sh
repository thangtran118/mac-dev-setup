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
    # postman
    iterm2
    # sublime-text
    # nvm

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
    formulahendry.auto-rename-tag
    formulahendry.auto-close-tag
    github.copilot
    github.copilot-chat
    editorconfig.editorconfig
    eamodio.gitlens
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    ms-azuretools.vscode-docker
)

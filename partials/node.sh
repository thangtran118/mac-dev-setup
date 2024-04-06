#!/bin/bash

get_consent "Do you want to install nvm, node, npm, yarn, pnpm"
if is_consent; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    nvm install --lts
    npm install -g npm@latest
    npm install -g yarn

    if ! has_command "corepack"; then
        e_pending "Installing corepack"
        brew install corepack
        e_success "corepack installed"
    fi

    corepack enable pnpm
fi

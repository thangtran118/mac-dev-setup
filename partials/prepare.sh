#!/bin/bash

if ! has_path $WORKING_DIR; then
    printf "\n"
    e_pending "Creating ~/$WORKING_DIR folder..."
    mkdir -p $HOME/$WORKING_DIR
    e_success "Created ~/$WORKING_DIR folder"
fi

if ! has_command "xcode-select"; then
    printf "\n"
    e_pending "Installing Xcode Command Line Tools..."
    xcode-select --install
    if has_command "xcode-select"; then
        e_success "Installed Xcode Command Line Tools"
    else
        e_failure "Failed to install Xcode Command Line Tools"
    fi
fi

if ! has_command "brew"; then
    printf "\n"
    e_pending "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if is_arm; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    brew doctor
    brew tap homebrew/cask-fonts
    if has_command "brew"; then
        e_success "Installed Homebrew"
    else
        e_failure "Failed to install Homebrew"
    fi
fi

if ! has_path ".ssh"; then
    printf "\n"
    e_pending "Generating SSH key"
    ssh-keygen -t ed25519 -C "$EMAIL"
    e_success "Generated SSH key"
fi

if has_command "git"; then
    printf "\n"
    e_pending "Configuring Git..."
    for config in "${GIT_CONFIG[@]}"; do
        git config --global ${config}
    done
    e_success "Configured Git"
fi

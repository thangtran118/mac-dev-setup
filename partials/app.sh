#!/bin/bash

get_consent "Do you want install apps by Homebrew"

if is_consent; then
    printf "\n"
    e_pending "Installing apps by Homebrew..."
    if has_command "brew"; then
        # Install brew formulas
        for formula in "${BREW_FORMULA[@]}"; do
            if ! has_brew_formula "$formula"; then
                printf "\n"
                e_pending "Installing $formula..."
                brew install $formula
            fi
        done

        # Install brew casks
        for cask in "${BREW_CASK[@]}"; do
            if ! has_brew_cask "$cask"; then
                printf "\n"
                e_pending "Installing $cask..."
                brew install --cask $cask
            fi
        done
    fi
    e_success "Installed apps by Homebrew"
fi

get_consent "Do you want to install Visual Studio Code extensions"
if is_consent; then
    printf "\n"
    e_pending "Installing Visual Studio Code extensions..."
    if has_command "code"; then
        for extension in "${VSCODE_EXTENSIONS[@]}"; do
            code --install-extension $extension
        done
    fi
    e_success "Installed Visual Studio Code extensions"
fi

# install docker desktop for mac
get_consent "Do you want to install Docker Desktop for Mac M1?"
if is_consent; then
    if is_arm; then
        printf "\n"
        e_pending "Downloading Docker.dmg..."
        curl -L https://desktop.docker.com/mac/main/arm64/Docker.dmg -o Docker.dmg

        e_pending "Installing Docker Desktop for Mac..."
        sudo hdiutil attach Docker.dmg
        sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
        sudo hdiutil detach /Volumes/Docker

        e_pending "Removing Docker.dmg..."
        rm Docker.dmg
        e_success "Installed Docker Desktop for Mac"
    else
        e_failure "Docker Desktop for Mac M1 is only available on Apple Silicon"
    fi
fi

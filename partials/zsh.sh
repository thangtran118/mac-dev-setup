#!/bin/bash

get_consent "Do you want to install zsh instead of bash"
if is_consent; then
    e_pending "Installing zsh"
    brew install zsh
    if has_command "zsh"; then
        e_success "zsh installed"
    else
        e_failure "zsh installation failed"
    fi

    e_pending "Setting zsh as default shell"
    if is_arm; then
        chsh -s $(which zsh)
    else
        chsh -s /usr/local/bin/zsh
    fi
    e_success "zsh set as default shell"

    e_pending "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    e_success "oh-my-zsh installed"

    e_pending "Installing zsh-autosuggestions"
    brew install zsh-autosuggestions
    echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>$HOME/.zshrc
    e_success "zsh-autosuggestions installed"

    e_pending "Installing zsh-syntax-highlighting"
    brew install zsh-syntax-highlighting
    echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>$HOME/.zshrc
    e_success "zsh-syntax-highlighting installed"

    source $HOME/.zshrc
fi

get_consent "Do you want to use Powerlevel10k theme"
if is_consent; then
    e_pending "Installing Powerlevel10k"
    brew install powerlevel10k
    echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>$HOME/.zshrc
    source $HOME/.zshrc

    get_consent "Do you want to use Powerlevel10k configuration wizard now"
    if is_consent; then
        p10k configure
    fi

    e_success "Powerlevel10k installed"
fi

#!/bin/bash

get_consent "Do you want to install pyenv? (NOT RECOMMEND if you're not working with Python)"
if is_consent; then
    brew install pyenv pyenv-virtualenv
    ZSHRC_FILE="$HOME/.zshrc"

    PYTHON_CONFIG='

# config python
alias pip=pip3
alias python=python3

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

'
    if ! grep -q 'export PATH="$HOME/.pyenv/bin:$PATH"' "$ZSHRC_FILE"; then
        echo "$PYTHON_CONFIG" >> "$ZSHRC_FILE"
        zsh -c "source $ZSHRC_FILE"
    else
        echo "Các dòng cấu hình pyenv đã tồn tại trong .zshrc"
    fi

    get_consent("Do you want install latest python version?")
    if is_consent; then
        # install python latest:
        latest_version=$(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1 | tr -d ' ')
        pyenv install $latest_version && pyenv global $latest_version
    fi
fi

#!/bin/bash

color_reset=$(tput sgr0)
color_red=$(tput setaf 1)
color_green=$(tput setaf 2)
color_yellow=$(tput setaf 3)
color_blue=$(tput setaf 4)

e_failure() {
    printf "${color_red}🔴  %s${color_reset}" "$@"
    printf "\n"
}

e_pending() {
    printf "${color_yellow}⏳  %s...${color_reset}" "$@"
    printf "\n"
}

e_success() {
    printf "${color_green}🟢  %s${color_reset}" "$@"
    printf "\n"
}

e_message() {
    printf "${color_blue}✨  %s${color_reset}" "$@"
    printf "\n"
}

is_arm() {
    if [[ $(uname -p) == 'arm' ]]; then
        return 0
    fi
    return 1
}

has_command() {
    if command -v "$1" >/dev/null 2>&1; then
        return 0
    fi
    return 1
}

has_app() {
    local name="$@"
    if [ -e "/Applications/$name.app" ]; then
        return 0
    fi
    return 1
}

has_path() {
    local path="$@"
    if [ -e "$HOME/$path" ]; then
        return 0
    fi
    return 1
}

has_brew_formula() {
    if brew list --formula | grep -q "^$1\$"; then
        return 0
    fi
    return 1
}

has_brew_cask() {
    if brew list --cask | grep -q "^$1\$"; then
        return 0
    fi
    return 1
}

is_consent() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}

get_consent() {
    printf "❔  %s? [y/n]:" "$@"
    read -p " " -n 1
    printf "\n"
}

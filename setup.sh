#!/bin/bash

source _utils.sh
source _config.sh

if ! [[ "${OSTYPE}" == "darwin"* ]]; then
    e_failure "Unsupported operating system (macOS only)"
    exit 1
fi

clear

# ------------------------------------------------------------------------------
e_message "Starting mac-dev-setup"
# ------------------------------------------------------------------------------

# source partials/prepare.sh
# source partials/system-customize.sh
# source partials/app.sh
# source partials/zsh.sh
# source partials/node.sh
source partials/python.sh

# ------------------------------------------------------------------------------
printf "\n"
e_message "mac-dev-setup complete"
# ------------------------------------------------------------------------------

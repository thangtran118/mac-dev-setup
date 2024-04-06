#!/bin/bash

# Customize Trackpad
get_consent "Do you want to enable Tap to click with one finge"
if is_consent; then
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
fi

get_consent "Do you want to authenticate for sudo by Touch ID"
if is_consent; then
    sudo sed -i '' '1a\'$'\n''auth       sufficient     pam_tid.so'$'\n' /etc/pam.d/sudo
fi

# Customize Finder
get_consent "Do you want to customize Finder"
if is_consent; then
    printf "\n"
    e_pending "Customizing Finder..."
    # Enable "Show all filename extensions"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Change Finder's search behavior to "Search the Current Folder"
    # "Search the Current Folder": "SCcf"
    # "Search This Mac": "SCev"
    # "Use the Previous Search Scope": "SCsp"
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    # Check "Open folders in tabs instead of new windows"
    defaults write com.apple.finder FinderSpawnTab -bool true

    # Set 'New Finder windows show' to the home folder (~/)
    defaults write com.apple.finder NewWindowTarget -string "PfHm"
    defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"

    # Show path bar in the bottom of the Finder windows
    defaults write com.apple.finder ShowPathbar -bool true

    # Set the default view style for folders to 'List'
    # Icon View: 'icnv'
    # Column View: 'clmv'
    # Cover Flow: 'Flwv'
    # List View: 'Nlsv'
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    # Keep folders on top when sorting by name
    defaults write com.apple.finder _FXSortFoldersFirst -bool true

    # Relaunch Finder to apply changes
    killall Finder

    e_success "Customized Finder"
fi

# Customize Menu Bar
get_consent "Do you want to change clock format in the menu bar(add seconds)"
if is_consent; then
    printf "\n"
    e_pending "Changing clock format in the menu bar..."
    defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm:ss a"
    e_success "Changed clock format in the menu bar"
fi

# Customize Dock
get_consent "Do you want to customize Dock"
if is_consent; then
    printf "\n"
    e_pending "Customizing Dock..."

    # Change dock position to left
    defaults write com.apple.dock orientation -string "left"
    # Set the icon size of Dock items to 36 pixels
    defaults write com.apple.dock tilesize -int 36
    # Enable magnification
    defaults write com.apple.dock magnification -bool true
    # Set the icon size of magnified Dock items to 128 pixels
    defaults write com.apple.dock largesize -int 128
    # Automatically hide and show the Dock
    defaults write com.apple.dock autohide -bool true
    # Remove the auto-hiding Dock delay
    defaults write com.apple.dock autohide-delay -float 0
    # Don’t show recent applications in Dock
    defaults write com.apple.dock show-recents -bool false

    # Relaunch Dock to apply changes
    killall Dock

    e_success "Customized Dock"
fi

#!/bin/zsh

makeLink () {
    TARGET_FILE=$1
    SOURCE_FILE="${DOTFILES}${${TARGET_FILE}#${HOME}}"
    [ ! -f ${SOURCE_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 1
    echo -e "\t${SOURCE_FILE} -> ${TARGET_FILE}"
    rm -f ${TARGET_FILE} && ln -s ${SOURCE_FILE} ${TARGET_FILE}
}

# up to you (me) if you want to run this as a file or copy paste at your leisure
sudo -v

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# OH_MY_ZSH
curl -L http://install.ohmyz.sh | sh

# jenv.io
curl -L -s get.jenv.io | bash

# update z from repository
# https://github.com/rupa/z
#git -C z pull

DOTFILES=${HOME}/.dotfiles
OH_MY_ZSH=${HOME}/.oh-my-zsh
[ ! -d ${DOTFILES} ] && echo "${DOTFILES} does not exist, exiting" && exit 1

echo "Setting up Zsh and Oh-My-Zsh custom additions"
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-settings

makeLink ${HOME}/.zshrc
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-settings/oh-my-settings.plugin.zsh
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-settings/oh-my-docker.plugin.zsh



# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

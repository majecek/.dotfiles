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
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

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
makeLink ${HOME}/bin

./osx-defaults.sh



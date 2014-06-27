# up to you (me) if you want to run this as a file or copy paste at your leisure
sudo -v

makeLink () {
    TARGET_FILE=$1
    SOURCE_FILE="${DOTFILES}${${TARGET_FILE}#${HOME}}"
    [ ! -f ${SOURCE_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 1
    echo -e "\t${TARGET_FILE} -> ${SOURCE_FILE}"
#    rm -f ${TARGET_FILE} && ln -s ${SOURCE_FILE} ${TARGET_FILE}
}


# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"


# https://github.com/robbyrussell/oh-my-zsh
#curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#chsh -s /usr/local/bin/zsh

curl -L http://install.ohmyz.sh | sh

# jenv.io
curl -L -s get.jenv.io | bash

# update z from repository
# https://github.com/rupa/z
#git -C z pull

DOTFILES=${HOME}/.dotfiles
OH_MY_ZSH=~/.oh-my-zsh
[ ! -d ${DOTFILES} ] && echo "${DOTFILES} does not exist, exiting" && exit 1


echo "Setting up Zsh and Oh-My-Zsh custom additions"
#makeLink ${HOME}/z.sh
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-settings
ln -s ${DOTFILES}/custom/plugins/oh-my-settings/oh-my-settings.plugin.zsh ${ZSH}/custom/plugins/oh-my-settings/
ln -s ${DOTFILES}/.zshrc ${HOME}/

#makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-settings/oh-my-settings.plugin.zsh




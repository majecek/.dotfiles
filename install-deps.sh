# up to you (me) if you want to run this as a file or copy paste at your leisure
sudo -v

makeLink () {
    TARGET_FILE=$1
    SOURCE_FILE="${DOTFILES}${${TARGET_FILE}#${HOME}}"
    [ ! -f ${SOURCE_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 1
    echo -e "\t${TARGET_FILE} -> ${SOURCE_FILE}"
    rm -f ${TARGET_FILE} && ln -s ${SOURCE_FILE} ${TARGET_FILE}
}


# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"


# https://github.com/robbyrussell/oh-my-zsh
#curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#chsh -s /usr/local/bin/zsh

# jenv.io
curl -L -s get.jenv.io | bash

# update z from repository
# https://github.com/rupa/z
git -C z pull



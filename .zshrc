
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir  vcs )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator  public_ip load time)
#POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"

#alias ll="ls -alF"
#alias gs="/usr/local/bin/groovyclient"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"

plugins=(git git-flow brew sublime history-substring-search mvn osx gem docker oh-my-settings oh-my-company oh-my-docker gradle )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/share/npm/bin
fpath=(/usr/local/share/zsh-completions $fpath)

export LC_ALL="en_US.utf-8"
export LANG="en_US.utf-8"

ORACLE_DIR=/opt/oracle
ORACLE_HOME=$ORACLE_DIR/ohome
DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
SQLPATH=$ORACLE_HOME

export DYLD_LIBRARY_PATH
export SQLPATH
export ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "${HOME}/.jenv/bin/jenv-init.sh" ]] && source "${HOME}/.jenv/bin/jenv-init.sh" && source "${HOME}/.jenv/commands/completion.sh"

# added by travis gem
[ -f /Users/marek/.travis/travis.sh ] && source /Users/marek/.travis/travis.sh

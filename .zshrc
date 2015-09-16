# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export PATH=$HOME/.bin:/usr/local/bin:$PATH

# Imported from .bashrc
alias .='ls'
alias ..='cd ..'

alias serve='ruby -run -e httpd . -p 1234'
alias v='vim'
alias gv='gvim'
alias rm='rm'

export WORKON_HOME=~/.Envs
source /usr/bin/virtualenvwrapper.sh

# Ignores duplicate commands in history
setopt HIST_IGNORE_DUPS


# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u


# enter as ls
magic-enter () {
  if [[ -z $BUFFER ]]; then
    echo ""
    if [[ -d .git ]]; then
      git status
    else
      ls
    fi
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N magic-enter
bindkey "^M" magic-enter
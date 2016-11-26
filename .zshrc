# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export PATH=$HOME/.bin:/usr/local/bin:$PATH

alias .='ls'
alias ..='cd ..'
alias serve='ruby -run -e httpd . -p 1234'
alias v='vim'
alias gv='gvim'
alias rm='rm'
alias octave='octave --no-gui'
alias firefox='firefox-beta-bin'

# Bind default application
alias -s pdf='zathura'
alias -s {txt,py,c,cpp,h,java,css,js,md,m}='gvim'
alias -s {jpg,png}='feh'
alias -s {mp3,wav,m4a}='mplayer'

# For python virtualenv
export WORKON_HOME=~/.Envs
source /usr/bin/virtualenvwrapper.sh

# For tensorflow
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64:/opt/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/opt/cuda


# Ignores duplicate commands in history
setopt HIST_IGNORE_DUPS


# autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
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


cnt() {
    ls -1 $1 | wc -l
}
autoload -Uz cnt

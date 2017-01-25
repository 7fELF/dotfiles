# Aliases
alias p='ping 8.8.8.8'
alias diff='git diff --no-index'
alias v='vim'
alias yd='youtube-dl'

# Docker
alias composer='docker run --rm -u $UID:$GID -v $(pwd):/app composer/composer'
alias php='docker run --rm -ti php:7'
alias cleanup_docker='docker ps -aq | xargs docker rm'
alias cleanup_docker_images='docker rmi $(docker images --quiet --filter "dangling=true")'

# Ungit
alias fungit='forever start $(which ungit) --no-launchBrowser'

# Epitech
alias blih='blih -u baudra_a'
alias ns_auth='ns_auth -u baudra_a'
alias emacs='emacs -nw'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -alh'

# Stop noisy hard drive
alias ftg='sudo hdparm -Y /dev/sda && sudo hdparm -C /dev/sda'


export EDITOR=vim

# Node.js
export NODE_ENV=development
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# parse json
# send key to retrive in params
# json "['key1']['key3']"
function json {
  export PYTHONIOENCODING=utf8
  python -c "import sys, json; print json.load(sys.stdin)$1"
}

function loop {
  echo "→ while :; do $@; sleep 1; done"
  while :; do $@; sleep 1; done
}

# robbyrussell/oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_CUSTOM="$HOME/dotfiles/zsh_custom"

# Hide username in prompt
DEFAULT_USER="$USER"

# Plugins
plugins=(git)
plugins=(docker)
plugins=(docker-compose)
plugins=(npm)
plugins=(nvm)
plugins=(node)
plugins=(rsync)
plugins=(tmux)

source $ZSH/oh-my-zsh.sh

# Use Ctrl-U Remove everything before cursor
bindkey \^U backward-kill-line

# Java
export PATH="$PATH:/usr/lib/jvm/jdk1.8.0/bin"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

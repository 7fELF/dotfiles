# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_CUSTOM="$HOME/dotfiles/zsh_custom"
DEFAULT_USER="$USER"

alias composer='docker run --rm -u $UID:$GID -v $(pwd):/app composer/composer'
alias php='docker run --rm -ti php:7'
alias cleanup_docker='docker ps -aq | xargs docker rm'
alias cleanup_docker_images='docker rmi $(docker images --quiet --filter "dangling=true")'
alias p='while [ 1 ]; do ping -c 25 8.8.8.8 && clear || sleep 1 || break; done;'
alias diff='git diff --no-index'

# Epitech
alias blih='blih -u baudra_a'
alias ns_auth='ns_auth -u baudra_a'
alias emacs='emacs -nw'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -alh'


export NODE_ENV=development

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(docker)
plugins=(docker-compose)
plugins=(npm)
plugins=(nvm)
plugins=(node)
plugins=(rsync)
plugins=(tmux)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

echo -e '\033]50;xft:Input-10\007'

bindkey \^U backward-kill-line
export PATH="$PATH:/home/antoine/.cask/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/antoine/golang/bin:/usr/lib/jvm/jdk1.8.0/bin:/home/antoine/Android/Sdk/platform-tools/"
export GOPATH='/home/antoine/golang'
export XLIB_SKIP_ARGB_VISUALS=1

alias ftg='sudo hdparm -Y /dev/sda && sudo hdparm -C /dev/sda'
alias haste="HASTE_SERVER=http://pastebin.pro haste"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

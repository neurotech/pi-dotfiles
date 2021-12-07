# append to the history file, don't overwrite it
shopt -s histappend

# Aliases
alias agu="sudo apt-get update && sudo apt-get upgrade"
alias refresh="source ~/.bashrc"
alias ..="cd .."
alias cd..="cd .."
alias ll='ls -all'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi

export LANGUAGE="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"
export LC_TYPE="en_GB.UTF-8"

# PS1
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '

# Path
export PATH="$HOME/.yarn/bin:/usr/local/node/bin:$PATH"
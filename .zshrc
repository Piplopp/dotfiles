# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jerome/.oh-my-zsh"


CASE_SENSITIVE="true"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
SAVEHIST=2000

setopt HIST_REDUCE_BLANKS

# for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# never ever beep ever
setopt NO_BEEP

# do not print error on non matched patterns
setopt nonomatch

# remove zsh annoying prompt when using the rm command
setopt rm_star_silent

# ZSH Plugins
plugins=(git pip)


# Load the theme
source $HOME/.zsh_theme
source $ZSH/oh-my-zsh.sh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto -n'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'



# move upward by n
function up(){
  minima=$1
  path=$PWD
  for ((i=1; i <= minima; i++))
  do
    path=$path/..
  done
  cd $path
}

# Aliases
alias df='df -Th'
alias dinopython='python2.7'
alias python='python3'
alias ipython='ipython3'
alias top='htop'

alias c='git commit'
alias s='git status'
alias a='git add'
alias p='git push'
alias R='R --vanilla'

alias cd-='cd -'
alias cd..='cd ..'
alias u='up'

export PATH="/home/jerome/.local/bin:$PATH"
# (for git) See https://stackoverflow.com/a/60498979
export LESS=-FRX

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jerome/tools/Other/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jerome/tools/Other/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jerome/tools/Other/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jerome/tools/Other/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# To fix the hostname displayed in prompt when within a CONDA env
# https://github.com/conda/conda/issues/7031
# Basically CONDA overwrite the $HOST variable used by zsh to determine the
# current hostname.
# The precmd is executed before displaying the prompt; and the
# preexec is executed just before the user command.
HOSTNAME="$(hostname)"
precmd() {
    OLDHOST="${HOST}"
    HOST="${HOSTNAME}"
}
preexec() {
    HOST="${OLDHOST}"
}

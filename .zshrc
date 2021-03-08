# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jerome/.oh-my-zsh"

CASE_SENSITIVE="true"

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
setopt CORRECT

# for sharing history between zsh processes
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
SAVEHIST=2000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# never ever beep ever
setopt NO_BEEP

# do not print error on non matched patterns
setopt nonomatch

# ZSH Plugins
plugins=(git pip)


# Load the theme
source .zsh_theme
source $ZSH/oh-my-zsh.sh


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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jerome/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jerome/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jerome/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jerome/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


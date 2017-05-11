# Exports
export LSCOLORS='--color=always'
export GREP_OPTIONS='--color=auto'

alias ls='ls --color=always'
alias less='less -r'
alias tree='tree -C'
alias tb='(head -5;echo -e "\n\n\n";tail -5) <'
alias lsdirs="ls -l | grep '^d'"
alias cleanTrash="/bin/rm -rf $HOME/.__trash/*"

## GIT
alias workspace='cd ~/workspace'
alias gst='git status'
alias gp='git pull'
alias gc='git commit'
alias gca='git commit --amend'
alias gr='git review'
alias gru='git review update'

## GIT branches
alias gb='git branch'
alias gco='git checkout'
alias gcm='git checkout master'
alias gm='git merge'
alias gsb='git show-branch --all'
alias gt='git log --graph --decorate --oneline'


# Sort files by Size
alias sls="ls -s | sort -n"

# Verbose output of commands by default
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"

# Always make directories recursively
alias mkdir="mkdir -p"

# Maintain history across sessions
alias dt='date "+%F %T"'
PROMPT_COMMAND='echo `dt` `pwd` $$ $USER "$(history 1)" >> $HOME/.bash_eternal_history'
#chmod 600 ~/.bash_eternal_history

alias hist="cat $HOME/.bash_eternal_history | grep $1"
alias getEnv="env | grep $1"

[ -f /etc/bashrc ] && source /etc/bashrc

export PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Complete sudo and man pages
complete -cf sudo man

# Load all bashes
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_work ] && source ~/.bash_work
[ -f ~/.bash_functions ] && source ~/.bash_functions

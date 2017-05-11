#Bash Functions

# Unrar the given file
function unrax() {
if (unrar vb "$1" | grep ".*/">/dev/null); then
   echo $1
   unrar x "$1"
else
   echo $1
   unrar x -ad "$1"
fi
}

# Unrar all the files in the pwd
function unrax-all() {
for i in $( ls *.rar ); do unrax "$i"; echo "$i"; done
}

# Method for recoverable delete (rm)
safe_rm () {
  local d t f s

  [ -z "$PS1" ] && (/bin/rm "$@"; return)

  d="${TRASH_DIR:=$HOME/.__trash}/`date +%W`"
  t=`date +%F_%H-%M-%S`
  [ -e "$d" ] || mkdir -p "$d" || return

  for f do
    [ -e "$f" ] || continue
    s=`basename "$f"`
    /bin/mv "$f" "$d/${t}_$s" || break
  done

  echo -e "[$? $t `whoami` `pwd`]$@\n" >> "$d/00rmlog.txt"
}

# Goto and list contents of dir
function cl(){ cd "$@" && la; }

# Method to extract any compressed file
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Function for bash_prompt coloring, custom PS1
function bash_prompt
{
local START="\[\033"
local END="\[\033[m\]"
local BLACK="[0;30m\]"
local BLUE="[0;34m\]"
local WHITE="[1;37m\]"
local PURPLE="[0;35m\]"
local BROWN="[0;33m\]"
local default="[0;39m\]"
local BRIGHTGREEN="[1;32m\]"
local GREEN="[0;32m\]"
local CYAN="[0;36m\]"
local GRAY="[0;37m\]"
local RED="[0;31m\]"
PS1="${START}${GREEN}\u${END}${START}${PURPLE}@${END}${START}${BROWN}\H${END}${START}${PURPLE}:${END}${START}${BRIGHTGREEN} {\j} ${END}${START}${GRAY}\W${END} $ "
}
bash_prompt


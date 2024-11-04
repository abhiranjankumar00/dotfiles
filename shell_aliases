# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Languages
alias g++='g++ -O2 -std=c++0x -Wno-unused-result -D_GLIBCXX_DEBUG -DDEBUG -Wall -Wshadow'
#alias ghc='ghc -O2 -fforce-recomp -rtsopts -fwarn-name-shadowing -auto-all -with-rtsopts="-A8m -K512m -p"'
#alias ghci='stack ghci'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cp='\gcp'
alias mv='mv -v'
alias rm='trash-put'
alias trash-restore='restore-trash'
alias rmdir='trash-put'

alias lss='ls -t --color=always | head'
alias pingcheck='ping www.google.com'
alias lastfile='ls --sort=t -c --color=yes --file-type *.cpp -r | head -n 1 | xargs  vim'
alias readJson='python -mjson.tool < '
alias todo='vim $HOME/.local/share/todo.md'
alias notes='vim $HOME/.local/share/notes.md'

# Subversioning
alias gs='git status'
alias gl0g='git l0g'

alias temp='cd ~/Temp'

# stack autocompletion
#eval "$(stack --bash-completion-script stack)"
#eval "$(thefuck --alias)"
alias ghc='stack ghc'
alias ghci='stack ghci'

function swapFiles()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function manSearch() {
  eval "apropos --exact $1 2> /dev/null 1> /dev/null"
  ret_val=$?

  if [[ ret_val -eq 16 ]]; then
      echo "No such command found"
  else
      numCommands=`apropos --exact $1 | wc -l`
      if [[ numCommands -eq 1 ]]; then
          man $1
      else
          #apropos --exact $1
          man -k "^${1}$"
          read -p "Select any option (-1 to exit): " opt
          man $opt $1
      fi
  fi
}


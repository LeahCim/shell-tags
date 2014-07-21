#!/bin/bash

# Command completion for the go() function
_go() {
  local -r DIR_TAG=$HOME/.go/tags/directory
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W  "$(\ls "$DIR_TAG")" -- "$cur") )
  return 0
}
complete -F _go go

function go() {
  # LIST is read-only and local to the function
  declare -r DIR_TAG=$HOME/.go/tags/directory
  if [ -z $1 ]; then
    ls "$DIR_TAG"
  elif [ -L "$DIR_TAG/$1" ] && [ -d $(readlink "$DIR_TAG/$1") ]; then
    cd $(readlink "$DIR_TAG/$1")
  elif [[ $1 == -a ]] && [ -d "$2" ]; then
    ln -s "$(cd "$2"; pwd)" "$DIR_TAG"
  elif [[ $1 == -r ]] && [ -L "$DIR_TAG/$2" ]; then
    rm "$DIR_TAG/$2"
  fi
}

#!/bin/bash

# Command completion for the list() function
_list() {
  local -r TAGS=$HOME/.go/tags
  local cur prev
  COMPREPLY=()
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  cur="${COMP_WORDS[COMP_CWORD]}"
  if [ -z $prev ] || [[ $prev == "list" ]]; then
    COMPREPLY=( $(compgen -W  "$(\ls "$TAGS")" -- "$cur") )
  elif [ -d "$TAGS/$prev/_TAGS_" ]; then
    COMPREPLY=( $(compgen -W  "$(\ls "$TAGS/$prev/_TAGS_")" -- "$cur") )
  fi
  return 0
}
complete -F _list list

function list() {
  # LIST is read-only and local to the function
  declare -r TAGS=$HOME/.go/tags
  if [ ! -d "$TAGS" ]; then
    mkdir -p "$TAGS"
  fi

  if [ -z $1 ]; then
    ls "$TAGS"
  elif [ -d "$TAGS/$1" ]; then
    ls -LR "$TAGS/$1"
  fi
}

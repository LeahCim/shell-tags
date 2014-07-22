#!/bin/bash

HERE=${BASH_SOURCE[0]%/*}

# Source functions
if [ -d "$HERE/functions" ]; then
  for f in "$HERE/functions"/*.sh; do
    if [ -r "$f" ]; then
      . "$f"
    fi
  done
  unset f
fi

unset HERE

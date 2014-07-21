#!/bin/bash

declare HERE=$(dirname "$0")

# Source my bash functions
if [ -d "$HERE/functions" ]; then
  for f in "$HERE/functions"/*.sh; do
    if [ -r "$f" ]; then
      . "$f"
    fi
  done
  unset f
fi

unset HERE

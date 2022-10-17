#!/bin/bash

function topof() {
  if [ -z "$1" ]; then
    echo "Opens-up top for the given process name, works even for multiple processes."
    echo "It's like you did pidof and then fed these PIDs to top."
    echo
    echo "  Usage: topof <name>"
    echo
    return 1
  fi
  top $2 -p `pgrep -d ',' $1`
}

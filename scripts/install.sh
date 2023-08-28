#!/bin/env bash

cli_help() {
        echo "
DotHUB - dotfile management cli - install
Usage: dothub [command]

Commands: 
  info      show a short descripion of what the command does
  help      show this page
  all       install all the available packages
  list      list available applications to install
  "     
        exit 1
}


KNOWN_COMMANDS="info help all list"

COMMAND_LIST="$(echo $KNOWN_COMMANDS | tr " " "\n")"


if [ $# -eq 0 ] || [ $1 = "help" ]; then
        cli_help 
fi


if echo $COMMAND_LIST | grep -wq $1 
then
        echo ""
else
        cli_help
fi


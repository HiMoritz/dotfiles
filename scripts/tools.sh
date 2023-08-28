#!/bin/env bash

is_zsh() {
        echo "$(which $SHELL | grep -wq zsh)"
}

check_root() {
        if [ $(id -u) -ne 0 ]; then 
                echo "Please run this command as root"
                exit 1
        fi 
}

cli_help() { echo "
DotHUB - dotfile management cli

Usage: dothub [command]

Commands: 
  install       install required applications
  list          list tools
  shell         install and configure zsh"
        exit 1
}


if [ $# -eq 0 ] || [ $1 == "help" ]; then
        cli_help
fi



# Installer for macos stuff
install_macos() {
        echo "Not implemented :("
        exit 1
}

install_ubuntu() {
        echo "" 
}


PLATFORM="$(uname -r)"

if [ $PLATFORM == "Darwin" ]; then
        echo "
Running under macOS, I can't install apps using proper package management. 
However, we can do a minimal installation with some programs.
        
        OhMyZsh (if zsh is active), Homebrew, Neovim"

fi

if [ -f /etc/os-release ]; then 
        OS="$(cat /etc/os-release | grep -w NAME | awk -F "=" '{gsub(/"/, "", $2); print $2}')"
        VERSION="$(cat /etc/os-release | grep -w VERSION| awk -F "=" '{gsub(/"/, "", $2); print $2}')"
        echo "Running under ${OS} version ${VERSION}"
else 
        echo "Cannot detect distribution under /etc/os-release. Unable to detect package manager"
        exit 1
fi

if [ $OS == "Ubuntu" ]; then 
        check_root
        echo "Using APT to install packages"

elif [ $OS == "Fedora" ]; then 
        echo "Using DNF to install packages"

else 
        echo "This script was written for Ubuntu and Fedora since these are the distros I use."
fi

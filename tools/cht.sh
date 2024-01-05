#!/usr/bin/env bash

languages=$(echo "golang lua typescript java nodejs javascript" | tr " " "\n")
coreutils=$(echo "xargs find mv sed awk tar" | tr " " "\n")

selected=$(printf "$languages\n$coreutils" | fzf --reverse --border)
echo Searching $selected

if [ -z $selected ]; then 
        echo "Provide a selection"
        exit 1
fi

read -p "Query: " query

if echo $languages | grep -wq $selected; then
        url=cht.sh/$selected/$(echo $query | tr " " "+") 
        command="curl -sS $url | bat | less"
else 
        command="curl -sS cht.sh/$selected~$query | bat | less"
fi

if [ -z $TMUX ]; then
        curl -sS $url | bat | less
else
        tmux neww bash -c "${command}"
fi

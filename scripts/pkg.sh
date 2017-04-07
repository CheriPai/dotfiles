#!/bin/bash
pac=$(checkupdates | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "$pac"
fi

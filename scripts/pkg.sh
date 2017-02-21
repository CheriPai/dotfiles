#!/bin/bash
pac=$(checkupdates | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "%{F#5b5b5b}%{F-} $pac"
fi

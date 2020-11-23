#!/usr/bin/env bash

printf "Listing currently logged in Surge.sh account ..."

# surge whoami

printf "\n\nPlace all the executables in a directory named \"dispatch\" \n\n"

DIR=./deploy
if [ -d "$DIR" ]; then
    printf '%s\n' "Removing old deploy files from ($DIR)"
    rm -rf "$DIR"
fi
mkdir deploy

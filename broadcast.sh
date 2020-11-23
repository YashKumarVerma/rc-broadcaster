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

printf "\n\n"
FILE=./dispatch/index.json
if [ -f "$FILE" ]; then
    printf "$FILE found, initiating deploy"
else
    printf "$FILE does not exist, cannot be deployed without index.\n"
    exit 1
fi

# generate index pages
cp -r index.html dataDump.json dispatch/* deploy
cd deploy
npx @hackcode/file-preview-page
cd ..
surge --project ./deploy --domain reverse-coding-2020.surge.sh

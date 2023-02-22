#!/bin/bash
if [ -z "$1" ]; then
    echo "Enter a github repo"
else
    TRIMMED=$(echo $1 | tr "/" "\n" | tail -n2)
    REPO=$(echo $TRIMMED | cut -d " " -f 2)
    OWNER=$(echo $TRIMMED | cut -d " " -f 1)

    TOKEN=$(pass git/tone)
    GIT_USER=$(git config user.name)
    # read -p 'Repository Name: ' REPO
    # read -p 'Repository Owner: ' OWNER
    git remote add origin "https://${GIT_USER}:${TOKEN}@github.com/${OWNER}/${REPO}.git"
fi    

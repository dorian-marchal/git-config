#!/bin/bash

if [ -n "$(git log -1 --pretty=%B | grep "^to-cancel-commit$")" ]
then
    echo 'ERROR : Unable to commit.'
    echo 'The last commit is a temporary one.'
    echo 'Use `git reset --soft HEAD^` to cancel it.'
    exit 1
else
    exit 0
fi

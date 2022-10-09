#!/usr/bin/env bash

git config --global user.email "james@lochhead.me"
git config --global user.name "James Lochhead"
git config --global init.defaultBranch main
git config --global signingkey B098DF51A57627121177DC3C180AB694A7EF5FC0
git config --global gpgsign true
git config --global pull.rebase true
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

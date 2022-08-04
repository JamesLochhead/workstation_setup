#!/usr/bin/env bash

repo_location="$1"

ln -fs "$repo_location/bashrc" "$HOME/.bashrc"
ln -fs "$repo_location/bash_profile" "$HOME/.bash_profile"

#!/usr/bin/env bash

repo_location="$1"

mkdir -p "$HOME/.byobu"
ln -sf "$repo_location/byobu/color.tmux" "$HOME/.byobu/color.tmux"
ln -sf "$repo_location/byobu/profile.tmux" "$HOME/.byobu/profile.tmux"
ln -sf "$repo_location/byobu/profile" "$HOME/.byobu/profile"
ln -sf "$repo_location/byobu/status" "$HOME/.byobu/status"

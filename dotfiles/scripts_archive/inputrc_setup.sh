#!/usr/bin/env bash

repo_location="$1"

inputrc_path_repo="$repo_location/inputrc"
inputrc_path_app="$HOME/.inputrc"

ln -sf "$inputrc_path_repo" "$inputrc_path_app"

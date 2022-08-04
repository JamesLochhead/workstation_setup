#!/usr/bin/env bash

repo_location="$1"

gpg_conf_path_repo="$repo_location/gnupg/gpg.conf"
gpg_conf_path_app="$HOME/.gnupg/gpg.conf"

ln -fs "$gpg_conf_path_repo" "$gpg_conf_path_app"

gpg_agent_conf_path_repo="$repo_location/gnupg/gpg-agent.conf"
gpg_agent_conf_path_app="$HOME/.gnupg/gpg-agent.conf"

ln -fs "$gpg_agent_conf_path_repo" "$gpg_agent_conf_path_app"

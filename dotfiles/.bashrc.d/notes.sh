#!/usr/bin/env bash

if [[ ! -d "$HOME/Notes" ]]; then
	read -p "Enter the base path for the notes repo: " base_path
	declare -a categories=("syntax" "theory" "software" "playbooks" "scratchpads" "old_notes" "languages")
	mkdir "$HOME/Notes"
	for category in "${categories[@]}"; do
		if [[ ! -L "$HOME/Notes/$category" ]]; then
			ln -s "$base_path/$category" "$HOME/Notes/$category"
		fi
	done
fi

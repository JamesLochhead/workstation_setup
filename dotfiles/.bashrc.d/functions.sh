#!/usr/bin/env bash

open_file_fzf_neovim() {
	local OLDIFS=$IFS
	IFS=
	local the_files=""
	readarray -d '' files < <(find -maxdepth 4 -not -path "*/.*" \
		-type f -print0 2>/dev/null)
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "No files found"
		return
	else
		for a_file in "${files[@]}"; do
			the_files+="$a_file"
			the_files+=$'\n'
		done
		local chosen_file="$(echo $the_files |
			fzf -0 -1 --tiebreak=end --preview='less {}' \
				--layout=reverse \
				--bind=shift-up:preview-page-up,shift-down:preview-page-down)"
		if [[ -f "$chosen_file" ]]; then
			nvim "$chosen_file"
		else
			echo "No file chosen"
		fi
	fi
	unset files
	IFS=$OLDIFS
}

if command -v nvim &>/dev/null && command -v fzf &>/dev/null; then
	export -f open_file_fzf_neovim
fi

preview_note_fzf_less() {
	local OLDIFS=$IFS
	IFS=
	local the_files=""
	readarray -d '' files < <(find -L "$HOME/Notes" -maxdepth 4 -not \
		-path "*/.*" -name "*.md" -type f -print0 2>/dev/null)
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "No files found"
		return
	else
		for a_file in "${files[@]}"; do
			the_files+="$a_file"
			the_files+=$'\n'
		done
		local chosen_file="$(echo $the_files |
			fzf -0 -1 --tiebreak=end --preview='less {}' \
				--layout=reverse --bind=shift-up:preview-page-up,shift-down:preview-page-down)"
		if [[ -f "$chosen_file" ]]; then
			less "$chosen_file"
		else
			echo "No file chosen"
		fi
	fi
	unset files
	IFS=$OLDIFS
}

if command -v fzf &>/dev/null; then
	export -f preview_note_fzf_less
fi

open_fzf_macos() {
	local OLDIFS=$IFS
	IFS=
	local the_files=""
	readarray -d '' files < <(find -maxdepth 4 -not \
		-path "*/.*" -print0 2>/dev/null)
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "No files found"
		return
	else
		for a_file in "${files[@]}"; do
			the_files+="$a_file"
			the_files+=$'\n'
		done
		local chosen_file="$(echo $the_files |
			fzf -0 -1 --tiebreak=end --preview='less {}' \
				--layout=reverse \
				--bind=shift-up:preview-page-up,shift-down:preview-page-down)"
		if [[ -e "$chosen_file" ]]; then
			open "$chosen_file"
		else
			echo "No file chosen"
		fi
	fi
	unset files
	IFS=$OLDIFS
}

if [[ "$OSTYPE" == "darwin"* ]] && command -v fzf &>/dev/null; then
	export -f open_fzf_macos
fi

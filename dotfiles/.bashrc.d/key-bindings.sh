#!/usr/bin/env bash

# fzf
if command -v fzf &>/dev/null &&
	command -v brew &>/dev/null &&
	[[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.bash" ]] &&
	[[ -L "$HOME/.homebrew" ]]; then
	source "$(brew --prefix)/opt/fzf/shell/key-bindings.bash"

	if [[ -f "$HOME/.local/share/fzf/fzf.git.sh" ]]; then
		source "$HOME/.local/share/fzf/fzf.git.sh"
	fi
fi

#!/usr/bin/env bash

if command -v starship &>/dev/null; then
	eval "$(starship init bash)"
	function set_win_title() {
		if [[ "$PWD" == "$HOME" ]]; then
			local title="~"
		else
			local title=$(basename "$PWD")
		fi
		echo -ne "\033]0; $title \007"
	}
	starship_precmd_user_func="set_win_title"
fi

if command -v direnv &>/dev/null; then
	eval "$(direnv hook bash)"
fi

if command -v lesspipe &>/dev/null; then
	# make less more friendly for non-text input files, see lesspipe(1)
	eval "$(SHELL=/bin/sh lesspipe)"
fi

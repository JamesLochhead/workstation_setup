#!/usr/bin/env bash

if command -v starship &>/dev/null; then
	eval "$(starship init bash)"
fi

if command -v direnv &>/dev/null; then
	eval "$(direnv hook bash)"
fi

if command -v lesspipe &>/dev/null; then
	# make less more friendly for non-text input files, see lesspipe(1)
	eval "$(SHELL=/bin/sh lesspipe)"
fi

#!/usr/bin/env bash

if command -v nvim &>/dev/null; then
	export VISUAL=nvim
	export EDITOR="$VISUAL"
fi

# Used by npm and pip
if [[ -d "$HOME/.local/bin" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# Ruby
if command -v ruby &>/dev/null; then
	export GEM_HOME="$HOME/.local"
fi

# npm -g installs to .local rather than /usr/local/
if command -v npm &>/dev/null; then
	export npm_config_prefix="$HOME/.local"
fi

# go installs to .local
if command -v go &>/dev/null; then
	export GOPATH="$HOME/.local"
	export GOBIN="$GOPATH/bin"
fi

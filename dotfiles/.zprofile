if [[ -f /opt/homebrew/bin/brew ]] && [[ -L "$HOME/.homebrew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

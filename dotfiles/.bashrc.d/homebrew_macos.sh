#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]] && [[ -L "$HOME/.homebrew" ]]; then

	# .homebrew is an empty file created by GNU Stow.
	# It is there to prevent a potential privilege escalation attack
	# on a host due to a misconfigured (777) /opt directory.

	if [[ -f /opt/homebrew/bin/brew ]]; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi

	if command -v brew &>/dev/null; then

		# Adapted from:
		# https://github.com/pkill37/linuxify/blob/master/.linuxify
		# Also somewhat improved in some ways.

		BREW_HOME="$(brew --prefix)"

		# Most programs
		if [[ -d "${BREW_HOME}/bin" ]]; then
			export PATH="${BREW_HOME}/bin:$PATH"
		fi
		if [[ -d "${BREW_HOME}/share/man" ]]; then
			export MANPATH="${BREW_HOME}/share/man:$MANPATH"
		fi
		if [[ -d "${BREW_HOME}/share/info" ]]; then
			export INFOPATH="${BREW_HOME}/share/info:$INFOPATH"
		fi

		# GNU Coreutils
		if [[ -d "${BREW_HOME}/opt/coreutils/libexec/gnubin" ]]; then
			export PATH="${BREW_HOME}/opt/coreutils/libexec/gnubin:$PATH"
		fi
		if [[ -d "${BREW_HOME}/opt/coreutils/libexec/gnuman" ]]; then
			export MANPATH="${BREW_HOME}/opt/coreutils/libexec/gnuman:$MANPATH"
		fi

 		# file aka file-formula
		if [[ -d ${BREW_HOME}/opt/file-formula/bin ]]; then
			export PATH="${BREW_HOME}/opt/file-formula/bin:$PATH"
		fi

		# make
		if command -v gmake &>/dev/null; then
			export PATH="${BREW_HOME}/opt/make/libexec/gnubin:$PATH"
			export MANPATH="${BREW_HOME}/opt/make/libexec/gnuman:$MANPATH"
		fi

		# grep
		if command -v ggrep &>/dev/null; then
			export PATH="${BREW_HOME}/opt/grep/libexec/gnubin:$PATH"
		fi

		# find
		if command -v gfind &>/dev/null; then
			export PATH="${BREW_HOME}/opt/findutils/libexec/gnubin:$PATH"
		fi

		# sed
		if command -v gsed &>/dev/null; then
			export PATH="${BREW_HOME}/opt/gnu-sed/libexec/gnubin:$PATH"
		fi

		# awk
		if command -v gawk &>/dev/null; then
			export PATH="${BREW_HOME}/opt/gawk/libexec/gnubin:$PATH"
		fi

		# patch
		if command -v gpatch &>/dev/null; then
			export PATH="${BREW_HOME}/opt/gpatch/libexec/gnubin:$PATH"
		fi

		# tar
		if command -v gtar &>/dev/null; then
			export PATH="${BREW_HOME}/opt/gnu-tar/libexec/gnubin:$PATH"
		fi

		# which
		if command -v gwhich &>/dev/null; then
			export PATH="${BREW_HOME}/opt/gnu-which/libexec/gnubin:$PATH"
		fi

		# unzip
		if [[ -d "${BREW_HOME}/opt/unzip/bin:$PATH" ]]; then
			export PATH="${BREW_HOME}/opt/unzip/bin:$PATH"
		fi

		# libressl
		if [[ -d "${BREW_HOME}/opt/libressl/bin" ]]; then
			export PATH="${BREW_HOME}/opt/libressl/bin:$PATH"
			export LDFLAGS="-L${BREW_HOME}/opt/libressl/lib"
			export CPPFLAGS="-I${BREW_HOME}/opt/libressl/include"
			export PKG_CONFIG_PATH="${BREW_HOME}/opt/libressl/lib/pkgconfig"
		fi

		# binutils
		if [[ -d "${BREW_HOME}/opt/binutils/bin" ]]; then
			export PATH="${BREW_HOME}/opt/binutils/bin:$PATH"
			export LDFLAGS="-L${BREW_HOME}/opt/binutils/lib"
			export CPPFLAGS="-I${BREW_HOME}/opt/binutils/include"
		fi

		# ruby
		if [[ -d "${BREW_HOME}/bin/opt/ruby/bin" ]]; then
			export PATH="${BREW_HOME}/opt/ruby/bin:$PATH"
		fi

		# python
		if [[ -d "${BREW_HOME}/opt/python/libexec/bin" ]]; then
			export PATH="${BREW_HOME}/opt/python/libexec/bin:$PATH"
		fi

		# Bash completions provided by Homebrew
		if [[ -f "${BREW_HOME}/etc/profile.d/bash_completion.sh" ]]; then
			source "${BREW_HOME}/etc/profile.d/bash_completion.sh"
		fi
		unset BREW_HOME
	fi
fi

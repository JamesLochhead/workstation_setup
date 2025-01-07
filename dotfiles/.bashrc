#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- == *i* ]] || return 0

# Order of the array matters
# Functions depend on Homebrew (for MacOS)
# Aliases depend on functions
# Completion depend on Homebrew (for MacOS)
# Hooks depend on Homebrew (for MacOS)
# Environment variables depend on:
#	- Homebrew (for MacOS)
#	- Home directory
# Git depends on Homebrew (for MacOS)
# Home directory has no dependencies
# Key bindings depend on Homebrew (for MacOS)

bashrc_files=(
	"$HOME/.bashrc.d/homebrew_macos.sh"
	"$HOME/.bashrc.d/functions.sh"
	"$HOME/.bashrc.d/aliases.sh"
	"$HOME/.bashrc.d/completion.sh"
	"$HOME/.bashrc.d/hooks.sh"
	"$HOME/.bashrc.d/home_directory.sh"
	"$HOME/.bashrc.d/env_vars.sh"
	"$HOME/.bashrc.d/git.sh"
	"$HOME/.bashrc.d/key-bindings.sh"
)

for rc_file in ${bashrc_files[@]}; do
	if [[ -f "$rc_file" ]]; then
		source "$rc_file"
	fi
done

# update terminal size
shopt -s checkwinsize

# ** matches all files and zero or more directories and subdirectories
shopt -s globstar

# append to the history file, don't overwrite it
shopt -s histappend

# the maximum number of commands to remember
HISTSIZE=20

# the maximum number of lines in the history file
HISTFILESIZE=20

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

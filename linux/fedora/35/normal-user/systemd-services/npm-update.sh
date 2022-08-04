#!/usr/bin/env bash

script_location=$(dirname "$(readlink -f "$0")")

cd "$script_location" || {
	echo "cd $script_location failed " >&2
	exit 1
}

< ../../npm-packages-list xargs npm update -g || echo "npm update -g failed" | mailx -s npm_failure james@localhost

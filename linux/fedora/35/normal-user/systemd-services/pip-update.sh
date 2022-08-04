#!/usr/bin/env bash

script_location=$(dirname "$(readlink -f "$0")")

cd "$script_location" || {
	echo "cd $script_location failed " >&2
	exit 1
}

< ../../pip-packages-list xargs pip3 install --user --upgrade || echo "pip3 install --user --upgrade failed" | mailx -s pip3_failure james@localhost

#!/usr/bin/env bash

set -eEuxo pipefail

if [[ "$1" == "work" ]]; then
	source ./00_config_work.sh
elif [[ "$1" == "personal" ]]; then
	source ./00_config_personal.sh
fi

main() {
	mkdir -p "$HOMEBREW_PATH"
	chown "$USER:$USER_GROUP" "$HOMEBREW_PATH"
	chmod 700 "/opt/homebrew-$USER/"
}

main "$@"

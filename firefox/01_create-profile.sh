#!/usr/bin/env bash

set -eEuxo pipefail

main() {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		firefox -CreateProfile james
		create_profile_success
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		LOCAL_FIREFOX_PATH="~/Applications/Firefox.app/Contents/MacOS/firefox"
		if [[ ! -f "$LOCAL_FIREFOX_PATH" ]]; then
			cat <<-EOF >>/dev/stderr
				CRITICAL:Firefox must be installed at $LOCAL_FIREFOX_PATH
			EOF
			exit 1
		fi
		"$LOCAL_FIREFOX_PATH" -CreateProfile james
		create_profile_success
	fi
}

create_profile_success() {
	cat <<-EOF >>/dev/stderr
		Successfully created the Firefox profile `james`. Make the
		profile default and launch it via `firefox -p` on Linux or
		`~/Applications/Firefox.app/Contents/MacOS/firefox -p` on MacOS.

		Also sign-in to Firefox.
	EOF
}

main "$@"

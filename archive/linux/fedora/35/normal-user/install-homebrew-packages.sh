#!/usr/bin/env bash

set -Eeuxo pipefail

main () {
	brew install yq kustomize
}


main "$@"

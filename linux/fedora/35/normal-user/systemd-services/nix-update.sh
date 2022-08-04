#!/usr/bin/env bash

nix-env -u || echo "nix upgrade for james failed" | mailx -s nix_failure james@localhost

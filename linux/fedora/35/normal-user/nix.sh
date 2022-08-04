#!/usr/bin/env bash
curl -L https://nixos.org/nix/install | sh
< ../nix-packages-list xargs nix-env -i

#!/usr/bin/env bash

systemctl enable --now podman.socket
touch /etc/containers/nodocker 			# supress messages when using Docker commands with Podman
loginctl enable-linger james 			# enable user-specific systemd
systemctl enable --now postfix.service
systemctl enable --now oomd

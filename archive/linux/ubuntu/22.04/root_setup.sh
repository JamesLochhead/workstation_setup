#!/usr/bin/env bash

#apt install -y podman podman-docker

#hostnamectl hostname work-laptop-02

#systemctl enable --now podman.socket
#touch /etc/containers/nodocker 			# supress messages when using Docker commands with Podman

loginctl enable-linger james 			# enable user-specific systemd

apt install -y pass gnome-tweaks

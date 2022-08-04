#!/usr/bin/env bash

# Install RPM Fusion
dnf install -y \
  "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"

dnf install -y \
  "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Install Hashicorp repository
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

# Required by Homebrew Linux: https://docs.brew.sh/Homebrew-on-Linux
dnf install -y procps-ng curl file git libxcrypt-compat
dnf groupinstall -y 'Development Tools'

# Install dnf packages
< ../dnf-packages-list xargs dnf -y install

# lpf-spotify-client pre-requisites
usermod -a -G pkg-build james

# Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

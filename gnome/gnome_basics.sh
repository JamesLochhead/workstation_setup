#!/usr/bin/env bash

gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'adaptive'
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
default_profile_uuid=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'\(.*\)'/\1/")
(sed "s/DEFAULT_UUID/$default_profile_uuid/" < gsettings/default-profile) | dconf load /org/gnome/terminal/
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.preferences click-policy 'single'
gsettings set org.gnome.nautilus.list-view use-tree-view true

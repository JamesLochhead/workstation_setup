#!/usr/bin/env bash
dir_name_rel=$(uuidgen)
dir_name_abs="/tmp/$dir_name_rel"
mkdir -p "$dir_name_abs"
chown root:root "$dir_name_abs"
chmod 700 "$dir_name_abs"
cd "$dir_name_abs" || exit
wget --content-disposition https://mullvad.net/download/app/rpm/latest
dnf -y install ./MullvadVPN*_x86_64.rpm
rm -rf "$dir_name_abs"

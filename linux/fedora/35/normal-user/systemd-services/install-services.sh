#!/usr/bin/env bash

script_location=$(dirname "$(readlink -f "$0")")
user_systemd_folder="$HOME/.config/systemd/user/"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Nix
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Nix paths
nix_update_timer_path="$user_systemd_folder/nix-update.timer"
nix_update_service_path="$user_systemd_folder/nix-update.service"
nix_update_service_repo="$script_location/nix-update.service"

mkdir -p "$user_systemd_folder"

cat > "$nix_update_service_repo" <<EOF
[Unit]
Description=Update Nix daily

[Service]
ExecStart=$script_location/nix-update.sh

[Install]
WantedBy=multi-user.target
EOF

ln -sf "$nix_update_service_repo" "$nix_update_service_path"
ln -sf "$script_location/nix-update.timer" "$nix_update_timer_path"

chmod u+x "$script_location/nix-update.sh"
systemctl --user enable --now nix-update.service
systemctl --user enable --now nix-update.timer

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Pip
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Pip paths
pip_update_timer_path="$user_systemd_folder/pip-update.timer"
pip_update_service_path="$user_systemd_folder/pip-update.service"
pip_update_service_repo="$script_location/pip-update.service"

mkdir -p "$user_systemd_folder"

cat > "$pip_update_service_repo" <<EOF
[Unit]
Description=Update Pip daily

[Service]
ExecStart=$script_location/pip-update.sh

[Install]
WantedBy=multi-user.target
EOF

ln -sf "$pip_update_service_repo" "$pip_update_service_path"
ln -sf "$script_location/pip-update.timer" "$pip_update_timer_path"

chmod u+x "$script_location/pip-update.sh"
systemctl --user enable --now pip-update.service
systemctl --user enable --now pip-update.timer

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# NPM
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# NPM paths
npm_update_timer_path="$user_systemd_folder/npm-update.timer"
npm_update_service_path="$user_systemd_folder/npm-update.service"
npm_update_service_repo="$script_location/npm-update.service"

mkdir -p "$user_systemd_folder"

cat > "$npm_update_service_repo" <<EOF
[Unit]
Description=Update NPM daily

[Service]
ExecStart=$script_location/npm-update.sh

[Install]
WantedBy=multi-user.target
EOF

ln -sf "$npm_update_service_repo" "$npm_update_service_path"
ln -sf "$script_location/npm-update.timer" "$npm_update_timer_path"

chmod u+x "$script_location/npm-update.sh"
systemctl --user enable --now npm-update.service
systemctl --user enable --now npm-update.timer

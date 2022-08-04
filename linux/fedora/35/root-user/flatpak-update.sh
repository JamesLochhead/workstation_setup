#!/usr/bin/env bash

# Flatpak paths
systemd_folder="/etc/systemd/system"
flatpak_update_timer_path="$systemd_folder/flatpak-update.timer"
flatpak_update_service_path="$systemd_folder/flatpak-update.service"
flatpak_update_installation_path="/opt/flatpak-update"
flatpak_update_script_path="/opt/flatpak-update/flatpak-update.sh"

mkdir -p "$flatpak_update_installation_path"

cat > "$flatpak_update_service_path" <<EOF
[Unit]
Description=Update Flatpak daily

[Service]
ExecStart=$flatpak_update_script_path

[Install]
WantedBy=multi-user.target
EOF

cat > "$flatpak_update_timer_path" <<EOF
[Unit]
Description=Run flatpak-update.service every day

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
EOF

cat > "$flatpak_update_script_path" <<EOF
#!/usr/bin/env bash
flatpak update -y || echo "flatpak update -y failed" | mailx -s flatpak_failure james@localhost
EOF

chmod u+x "$flatpak_update_script_path"

systemctl enable --now flatpak-update.service
systemctl enable --now flatpak-update.timer

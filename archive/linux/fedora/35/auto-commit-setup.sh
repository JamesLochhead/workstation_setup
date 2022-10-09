#!/usr/bin/env bash

cd /home/james/Git/fedora-35-install/ && git config core.sharedrepository true

cat << "EOF" > /usr/bin/home-daemon
#!/usr/bin/env bash
branch="laptop"
inotifywait -r -m /home/james/Git/fedora-35-install/ -e create -e move -e delete -e modify --exclude ".*\.git.*" |
	while read path action file; do
		/home/james/Git/fedora-35-install/auto-commit.sh "$branch"
	done
EOF

chmod a+x /usr/bin/home-daemon
chmod a+x /home/james/Git/fedora-35-install/auto-commit.sh

cat <<EOF > /etc/systemd/system/home-daemon.service
[Unit]
Description=home-daemon

[Service]
User=home-daemon
ExecStart=/usr/bin/home-daemon

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --now home-daemon.service

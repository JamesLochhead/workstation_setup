#!/usr/bin/env bash

rpm --import https://packages.microsoft.com/keys/microsoft.asc

tee /etc/yum.repos.d/msteams.repo << EOF
[msteams]
name=Microsoft Teams
baseurl=https://packages.microsoft.com/yumrepos/ms-teams
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

dnf install -y teams

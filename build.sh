#!/bin/bash

set -ouex pipefail

MAJOR_VERSION_NUMBER="$(sh -c '. /usr/lib/os-release ; echo $VERSION_ID | cut -d'.' -f1')"
export MAJOR_VERSION_NUMBER

dnf install -y tmux 

dnf config-manager --add-repo "https://pkgs.tailscale.com/stable/rhel/${MAJOR_VERSION_NUMBER}/tailscale.repo"
dnf config-manager --set-disabled tailscale-stable
dnf -y --enablerepo tailscale-stable install \
	tailscale

systemctl enable podman.socket

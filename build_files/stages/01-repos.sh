#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Setup Flathub and disable Fedora Flatpaks
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl disable flatpak-add-fedora-repos.service

# VSCodium
rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
dnf5 -y config-manager addrepo --from-repofile=/etc/yum.repos.d/vscodium.repo
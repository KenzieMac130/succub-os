#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Setup Flathub and disable Fedora Flatpaks
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl disable flatpak-add-fedora-repos.service

# VSCodium
rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

# RPM Fusion (non-free packages)
dnf5 install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# needed for steam
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1

# Kopia
rpmkeys --import https://kopia.io/signing-key

# RClone
set +ouex pipefail # needs pipefail off
curl https://rclone.org/install.sh | bash -s beta
set -ouex pipefail
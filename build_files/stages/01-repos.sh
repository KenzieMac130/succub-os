#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Setup Flathub and remove Fedora Flatpaks
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl disable flatpak-add-fedora-repos.service

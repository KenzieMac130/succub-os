#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Setup Flathub and disable Fedora Flatpaks
systemctl disable flatpak-add-fedora-repos.service
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-delete --force fedora
flatpak remote-delete --force fedora-testing

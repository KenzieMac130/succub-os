#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# needed for steam
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1

remove_packages=(
    "kate"
)

add_packages=(
    "earlyoom"
    "input-remapper"
    "helvum"
    "easyeffects"
    "codium"
    "lutris"
    "steam"
)

for remove_package in "${remove_packages[@]}"
do
    dnf5 -y remove $remove_package
done

for add_package in "${add_packages[@]}"
do
    dnf5 -y install $add_package
done
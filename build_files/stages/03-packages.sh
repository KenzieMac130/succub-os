#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

remove_packages=(
    "kate"
)

add_packages=(
    "tldr"
    "unrar"
    "unrar-free"
    "kopia"
    "earlyoom"
    "input-remapper"
    "qpwgraph"
    "easyeffects"
    "codium"
    "lutris"
    "steam"
    "mangohud"
    "obs-studio"
    "obs-studio-plugin-vkcapture"
)

for remove_package in "${remove_packages[@]}"
do
    dnf5 -y remove $remove_package
done

for add_package in "${add_packages[@]}"
do
    dnf5 -y install $add_package
done
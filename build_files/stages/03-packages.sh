#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

packages=(
    "earlyoom"
    "input-remapper"
    "helvum"
    "easyeffects"
)

for package in "${packages[@]}"
do
    dnf5 -y install $package
done
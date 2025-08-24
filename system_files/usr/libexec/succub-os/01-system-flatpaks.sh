#!/usr/bin/bash

set -euo pipefail

# todo... versioning

add_package=(
    "org.videolan.VLC"
    "org.speedcrunch.SpeedCrunch"
    "org.kde.gwenview"
)

for add_package in "${add_packages[@]}"
do
    flatpak install $add_package -y
done
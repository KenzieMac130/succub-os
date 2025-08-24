#!/usr/bin/bash

# todo... versioning

# Remove Fedora Flatpaks
flatpak remote-delete --system --force fedora
flatpak remote-delete --user --force fedora
flatpak remote-delete --system --force fedora-testing
flatpak remote-delete --user --force fedora-testing

add_package=(
    "org.videolan.VLC"
    "org.speedcrunch.SpeedCrunch"
    "org.kde.gwenview"
)

for add_package in "${add_packages[@]}"
do
    flatpak install flathub $add_package -y --noninteractive 
done
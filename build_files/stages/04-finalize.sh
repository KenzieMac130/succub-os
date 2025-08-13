#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Setup systemd
systemctl enable input-remapper
systemctl enable earlyoom

# Hide unnecesary LSP icons if visible
# todo: just remove them? (this hasn't been an issue yet)
# see: https://www.reddit.com/r/linux4noobs/comments/g40e3a/unwanted_lsp_plugins_showing_up/
find /usr/share/applications -name "*lsp_plug*desktop" 2>/dev/null | while read -r file; do
    dest="$HOME/.local/share/applications/$(basename "$file")"
    cp "$file" "$dest"
    # Add newline if the last byte isn't a newline
    [ "$(tail -c1 "$dest")" != "" ] && echo >> "$dest"
    echo "NoDisplay=true" >> "$dest"
done

# Remove unnecesary Calf Plugin icons
rm /usr/share/applications/calf.desktop || true
#!/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Hide LSP icons if visible
# see: https://www.reddit.com/r/linux4noobs/comments/g40e3a/unwanted_lsp_plugins_showing_up/
find /usr/share/applications -name "*lsp_plug*desktop" 2>/dev/null | while read -r file; do
    dest="$HOME/.local/share/applications/$(basename "$file")"
    cp "$file" "$dest"
    # Add newline if the last byte isn't a newline
    [ "$(tail -c1 "$dest")" != "" ] && echo >> "$dest"
    echo "NoDisplay=true" >> "$dest"
done

# Setup systemd
systemctl enable input-remapper
systemctl enable earlyoom
#!/bin/bash

set -euo pipefail

# Remove Fedora Flatpaks
flatpak remote-delete --system --force fedora || true
flatpak remote-delete --user --force fedora || true
flatpak remote-delete --system --force fedora-testing || true
flatpak remote-delete --user --force fedora-testing || true

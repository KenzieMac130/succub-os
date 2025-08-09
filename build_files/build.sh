#!/bin/bash

set -ouex pipefail

# Create image-info.json
/ctx/build_files/stages/00-image-info.sh

# test to see if this works...
rpm-ostree install vlc
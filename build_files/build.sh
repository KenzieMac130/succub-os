#!/bin/bash

set -ouex pipefail

# Copy System Files
rsync -rvK /ctx/system_files/ /

# Create image-info.json
/ctx/build_files/stages/00-image-info.sh

# Setup Repositories
/ctx/build_files/stages/01-repos.sh

# Install Kernel Mods
/ctx/build_files/stages/02-kernel-mods.sh

# Install Packages
/ctx/build_files/stages/03-packages.sh

# Finalize Image
/ctx/build_files/stages/04-finalize.sh
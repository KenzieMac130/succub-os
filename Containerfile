# Setup OS
ARG BASE_IMAGE_NAME="kinoite"
ARG FEDORA_MAJOR_VERSION="42"
ARG SOURCE_IMAGE="${BASE_IMAGE_NAME}-main"
ARG BASE_IMAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}"

# Setup Context
FROM scratch AS ctx
COPY /build_files /build_files
COPY /just /just

# Base Image
FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

# Configure (see justfile too)
ARG BASE_IMAGE_NAME="kinoite"
ARG FEDORA_MAJOR_VERSION="42"
ARG IMAGE_NAME="succub-os"
ARG IMAGE_VENDOR="kenziemac130"
ARG SHA_HEAD_SHORT="0248acdf"
ARG VERSION=""

# Build
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh && \
    ostree container commit
    
# Verify Contents
RUN bootc container lint

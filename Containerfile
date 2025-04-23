# Environments
ARG IMAGE_NAME="${IMAGE_NAME:-bazzite}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-coxde}"
ARG BASE_IMAGE_DIGEST="${BASE_IMAGE_DIGEST}"

# Build context
FROM scratch AS ctx
COPY build_files /

# Base image
FROM ghcr.io/ublue-os/bazzite:stable${BASE_IMAGE_DIGEST:+@${BASE_IMAGE_DIGEST}} AS base

# Build
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit

# Linting
RUN bootc container lint
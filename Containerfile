# Build context
FROM scratch AS ctx
COPY / /

# Base image
FROM ghcr.io/ublue-os/bazzite:stable AS base

# Environments
ARG IMAGE_NAME="${IMAGE_NAME:-bazzite}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-coxde}"

# Build
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh && \
    ostree container commit && \
    bootc container lint
    

#!/bin/sh
docker buildx build --platform linux/amd64,linux/arm64 -f musl.Dockerfile -t ghcr.io/bdwyertech/go-crosscompile:musl .
docker login ghcr.io/bdwyertech
docker push ghcr.io/bdwyertech/go-crosscompile:musl

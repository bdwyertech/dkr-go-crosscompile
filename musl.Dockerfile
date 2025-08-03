# docker login ghcr.io/bdwyertech
# docker push ghcr.io/bdwyertech/go-crosscompile:musl
FROM alpine AS downloader

# Install curl
RUN apk add --no-cache curl

# Download musl toolchain tarball from OCI registry artifact (replace URL as needed)
RUN curl -L -o /aarch64-linux-musl-cross.tgz "https://musl.cc/aarch64-linux-musl-cross.tgz"

FROM scratch
COPY --from=downloader /aarch64-linux-musl-cross.tgz /

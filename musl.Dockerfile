# docker buildx build --platform linux/amd64,linux/arm64 -f musl.Dockerfile .
# docker login ghcr.io/bdwyertech
# docker push ghcr.io/bdwyertech/go-crosscompile:musl
FROM alpine AS downloader

# Install curl
RUN apk add --no-cache curl

RUN curl -sfL "https://musl.cc/aarch64-linux-musl-cross.tgz" | tar zxf - -C /usr/ --strip-components=1

FROM scratch
COPY --from=downloader /usr/aarch64-linux-musl /usr/aarch64-linux-musl

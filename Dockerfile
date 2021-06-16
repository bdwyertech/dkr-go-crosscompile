FROM golang:1.16-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.title="bdwyertech/go-crosscompile" \
      org.opencontainers.image.description="For cross-compiling with CGO enabled" \
      org.opencontainers.image.authors="Brian Dwyer <bdwyertech@github.com>" \
      org.opencontainers.image.url="https://hub.docker.com/r/bdwyertech/go-crosscompile" \
      org.opencontainers.image.source="https://github.com/bdwyertech/dkr-go-crosscompile.git" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE \
      org.label-schema.name="bdwyertech/go-crosscompile" \
      org.label-schema.description="For cross-compiling with CGO enabled" \
      org.label-schema.url="https://hub.docker.com/r/bdwyertech/go-crosscompile" \
      org.label-schema.vcs-url="https://github.com/bdwyertech/docker-go-crosscompile.git"\
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE

RUN apk add bash curl git gtk+3.0-dev libappindicator-dev mingw-w64-gcc

ENV LD_LIBRARY_PATH=/osxcross/target/lib

RUN git clone https://github.com/tpoechtrager/osxcross.git /osxcross

RUN curl -sfLo /osxcross/tarballs/MacOSX11.3.sdk.tar.xz https://github.com/bdwyertech/dkr-crosscompile/releases/download/macsdk/MacOSX11.3.sdk.tar.xz \
    && apk add --no-cache --virtual .build-deps build-base bsd-compat-headers clang cmake libxml2-dev openssl-dev fts-dev python3 xz \
    && OSX_VERSION_MIN=10.10 UNATTENDED=1 /osxcross/build.sh \
    && rm -f /osxcross/tarballs/MacOSX11.3.sdk.tar.xz \
    && apk del .build-deps

ENV PATH /osxcross/target/bin:$PATH

WORKDIR /go

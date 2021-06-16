FROM golang:1.16-alpine

RUN apk add git mingw-w64-gcc

ENV LD_LIBRARY_PATH=/osxcross/target/lib

WORKDIR /
RUN git clone https://github.com/tpoechtrager/osxcross.git

COPY MacOSX11.3.sdk.tar.xz /osxcross/tarballs/

RUN apk add bash build-base bsd-compat-headers clang cmake libxml2-dev openssl-dev fts-dev python3 xz

RUN OSX_VERSION_MIN=10.10 UNATTENDED=1 /osxcross/build.sh

ENV PATH /osxcross/target/bin:$PATH

WORKDIR /go

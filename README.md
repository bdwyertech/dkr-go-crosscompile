# CGO Cross Compilation on Alpine Linux
[![](https://images.microbadger.com/badges/image/bdwyertech/go-crosscompile.svg)](https://microbadger.com/images/bdwyertech/dkr-go-crosscompile)
[![](https://images.microbadger.com/badges/version/bdwyertech/go-crosscompile.svg)](https://microbadger.com/images/bdwyertech/dkr-go-crosscompile)

This is an image intended for Go cross-compilation, primarily for Mac & Windows.  This was created out of a need to build a system tray application for both platforms.

### Usage
```bash
# Mac
export CGO_ENABLED=1
export CC=o64-clang
export CXX=o64-clang++

# Windows
export CGO_ENABLED=1
export CC=x86_64-w64-mingw32-gcc
export CXX=x86_64-w64-mingw32-g++
```

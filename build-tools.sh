#!/bin/bash
# Build the Mac SDK from the XCode Command Line Tools
# Afterward, upload to this release: https://github.com/bdwyertech/dkr-go-crosscompile/releases/tag/macsdk

rm -rf osxcross
git clone --depth 1 https://github.com/tpoechtrager/osxcross osxcross
osxcross/tools/gen_sdk_package_tools.sh

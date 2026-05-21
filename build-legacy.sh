#!/bin/bash
# Build with Windows 7 / Ubuntu 18.04 support

export VSCODE_ELECTRON_VERSION="22.3.27"
export VSCODE_GLIBC_VERSION="2.27"
export WIN7_COMPAT=1
export DISABLE_AVX=1
export MSVC_VERSION=2019

echo "Building VSCodium with legacy OS support:"
echo "  - Windows 7 (NT 6.x) compatible"
echo "  - Ubuntu 18.04 / glibc 2.27 compatible"
echo "  - Non-AVX CPU support"
echo "  - 32-bit Windows support"

./build.sh

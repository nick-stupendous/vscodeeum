#!/bin/bash
set -e

echo "========================================="
echo "Building VSCodium with Alex's Legacy Patches"
echo "========================================="

# Set legacy environment variables
export VSCODE_ELECTRON_VERSION="22.3.27"
export VSCODE_GLIBC_VERSION="2.27"
export WIN7_COMPAT=1
export DISABLE_AVX=1
export MSVC_VERSION=2019

# Step 1: Prepare VS Code source
echo "Step 1: Preparing VS Code source..."
./prepare_vscode.sh

# Step 2: Enter vscode directory
cd vscode || { echo "vscode directory not found!"; exit 1; }

# Step 3: Install dependencies with yarn
echo "Step 2: Installing dependencies..."
yarn install --frozen-lockfile --ignore-scripts

# Step 4: Build the editor
echo "Step 3: Building VSCode..."
yarn compile-build
yarn compile-extensions-build
yarn minify-vscode

# Step 5: Package for Linux
cd ..
echo "Step 4: Creating .deb package..."
./package_linux_bin.sh

echo "========================================="
echo "Build complete! Check for .deb files"
echo "========================================="

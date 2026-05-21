#!/bin/bash
set -e

# Copy files
cp -rp src/stable/* vscode/ 2>/dev/null || true
cp -f LICENSE vscode/LICENSE.txt 2>/dev/null || true

cd vscode

# Apply patches, ignoring failures
for patch in ../patches/*.patch; do
  echo "Applying: $(basename $patch)"
  patch -p1 --forward < "$patch" 2>/dev/null || echo "  Skipped: $(basename $patch)"
done

# Set product.json settings
cat product.json | jq '.nameShort = "Codium"' | jq '.nameLong = "Codium"' > product.json.tmp
mv product.json.tmp product.json

cd ..

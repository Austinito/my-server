#!/usr/bin/env bash
set -euo pipefail

ENV_NAME="${1:-dev}"
XML_REPO_PATH="${2:-../xml-repo}"

VERSION_FILE="deploy/versions/${ENV_NAME}.xml-version"

if [ ! -f "$VERSION_FILE" ]; then
  echo "Missing version file: $VERSION_FILE"
  exit 1
fi

XML_VERSION="$(tr -d '[:space:]' < "$VERSION_FILE")"
BUNDLE_PATH="${XML_REPO_PATH}/bundles/${XML_VERSION}.tar.gz"

if [ ! -f "$BUNDLE_PATH" ]; then
  echo "Missing XML bundle: $BUNDLE_PATH"
  exit 1
fi

rm -rf runtime/xml
mkdir -p runtime/xml
tar -xzf "$BUNDLE_PATH" -C runtime/xml

echo "Loaded XML version: $XML_VERSION"
echo "Contents:"
find runtime/xml -type f -maxdepth 2 | sort
echo
cat runtime/xml/config.xml

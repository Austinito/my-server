#!/usr/bin/env bash
set -euo pipefail

ENV_NAME="${1:-dev}"
XML_VERSION="${2:-}"

if [ -z "$XML_VERSION" ]; then
  echo "ERROR: XML version must be provided"
  exit 1
fi

XML_REPO_PATH="${3:-../xml-repo}"
BUNDLE_PATH="${XML_REPO_PATH}/bundles/${XML_VERSION}.tar.gz"

if [ ! -f "$BUNDLE_PATH" ]; then
  echo "ERROR: Missing XML bundle: $BUNDLE_PATH"
  exit 1
fi

rm -rf runtime/xml
mkdir -p runtime/xml
tar -xzf "$BUNDLE_PATH" -C runtime/xml

echo "Loaded XML version: $XML_VERSION for $ENV_NAME"

#!/usr/bin/env bash
set -euo pipefail

XML_VERSION="${XML_VERSION:-unknown}"

echo "Starting my-server"
echo "RUNTIME XML VERSION (based on env var): ${XML_VERSION}"

if [ ! -f runtime/xml/config.xml ]; then
  echo "No XML loaded. Run scripts/load-xml.sh first."
  exit 1
fi

echo "Loaded XML contents:"
grep "<version>" runtime/xml/config.xml || true

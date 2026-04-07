#!/usr/bin/env bash
set -euo pipefail

if [ ! -f runtime/xml/config.xml ]; then
  echo "No XML loaded. Run scripts/load-xml.sh first."
  exit 1
fi

echo "Starting my-server with:"
grep "<version>" runtime/xml/config.xml
grep "<message>" runtime/xml/config.xml

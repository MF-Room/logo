#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <size>"
    echo "  size: width in pixels (e.g. 512)"
    exit 1
fi

SIZE="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for svg in "$SCRIPT_DIR"/*.svg; do
    base="$(basename "$svg" .svg)"
    out="$SCRIPT_DIR/${base}_${SIZE}.png"
    inkscape "$svg" --export-type=png --export-filename="$out" --export-width="$SIZE"
    echo "Exported $out"
done

#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(cd "$ROOT_DIR/../.." && pwd)"
TOOLS_DIR="$PARENT_DIR/.tools"
TECTONIC_DIR="$TOOLS_DIR/tectonic"
TECTONIC_BIN="$TECTONIC_DIR/tectonic"

ASSET_URL="https://github.com/tectonic-typesetting/tectonic/releases/download/continuous/tectonic-0.15.0%2B20251006-aarch64-apple-darwin.tar.gz"
ARCHIVE_PATH="$TOOLS_DIR/tectonic-aarch64-apple-darwin.tar.gz"

mkdir -p "$TOOLS_DIR"

if [[ ! -x "$TECTONIC_BIN" ]]; then
  echo "Downloading tectonic into $TECTONIC_DIR"
  rm -rf "$TECTONIC_DIR"
  mkdir -p "$TECTONIC_DIR"

  curl -L --fail -o "$ARCHIVE_PATH" "$ASSET_URL"
  tar -xzf "$ARCHIVE_PATH" -C "$TECTONIC_DIR"

  if [[ ! -f "$TECTONIC_BIN" ]]; then
    FOUND_BIN="$(find "$TECTONIC_DIR" -maxdepth 3 -type f -name tectonic -perm -111 | head -n 1 || true)"
    if [[ -n "${FOUND_BIN:-}" ]]; then
      mv "$FOUND_BIN" "$TECTONIC_BIN"
    fi
  fi

  chmod +x "$TECTONIC_BIN"
fi

cd "$ROOT_DIR"

# Create output directory
mkdir -p "$PARENT_DIR/output/logs"

# Get template name from current directory
TEMPLATE_NAME="$(basename "$ROOT_DIR")"

if [[ -f "$PARENT_DIR/data/input-data.json" ]]; then
  echo "Generating template/_config.tex from data/input-data.json"
  python3 "$PARENT_DIR/scripts/generate_config.py" "$TEMPLATE_NAME"
fi

echo "Building template/resume.tex -> output/resume.pdf"
"$TECTONIC_BIN" -X compile template/resume.tex --keep-logs --keep-intermediates --outdir "$PARENT_DIR/output/logs"

# Move output files to output directory
mv "$PARENT_DIR/output/logs/resume.pdf" "$PARENT_DIR/output/resume.pdf" 2>/dev/null || true

echo "Done:"
echo "  $PARENT_DIR/output/resume.pdf"
echo "  Logs: $PARENT_DIR/output/logs/"

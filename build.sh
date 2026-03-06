#!/usr/bin/env bash
# Build resume.tex to PDF (run from this directory)

set -e
cd "$(dirname "$0")"

# Use pdflatex from MacTeX/BasicTeX if on PATH, or common install locations
for pdflatex in pdflatex /Library/TeX/texbin/pdflatex /usr/local/bin/pdflatex; do
  if command -v "$pdflatex" &>/dev/null || [ -x "$pdflatex" ]; then
    echo "Building with: $pdflatex"
    "$pdflatex" -interaction=nonstopmode resume.tex
    echo "Done. Open resume.pdf to view."
    exit 0
  fi
done

echo "Error: pdflatex not found. Install a LaTeX distribution first:"
echo "  Option 1 (recommended): Install BasicTeX"
echo "    /opt/homebrew/bin/brew install --cask basictex"
echo "    Then restart terminal or run: eval \"\$(/usr/libexec/path_helper)\""
echo "  Option 2: Download MacTeX from https://tug.org/mactex/"
exit 1

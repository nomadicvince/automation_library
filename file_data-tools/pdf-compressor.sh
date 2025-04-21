#!/bin/bash
# pdf-compressor.sh

echo "==== PDF Merger + Compressor ===="

read -p "Enter output PDF name (e.g. merged.pdf): " output
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS=/ebook -sOutputFile="$output" "$@"

echo "PDFs merged and compressed into $output"
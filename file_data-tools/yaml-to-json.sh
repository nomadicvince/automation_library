#!/bin/bash
# yaml-to-json.sh
# Converts a YAML file to JSON using yq.

echo "==== YAML to JSON Converter ===="

read -p "Enter path to the YAML file: " yaml_file

# Validate file
if [[ ! -f "$yaml_file" ]]; then
  echo "File not found: $yaml_file"
  exit 1
fi

# Install yq if missing
if ! command -v yq &> /dev/null; then
  echo "yq is not installed. Installing..."
  sudo dnf install -y yq
fi

# Convert
output="${yaml_file%.*}.json"
yq -o=json "$yaml_file" > "$output"

echo "Conversion complete: $output"
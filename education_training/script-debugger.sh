#!/bin/bash
# script-debugger.sh
# Helps diagnose issues in a Bash script with debug tips and optional tracing.

clear
echo "==== Bash Script Debugger Assistant ===="
echo "This tool provides debugging tips and offers to run your script with tracing."

read -p "Enter the path to your script: " script

if [[ ! -f "$script" ]]; then
  echo "File not found: $script"
  exit 1
fi

echo -e "\nChecking script for potential issues..."
grep -En '^\s*[^#]*read\s' "$script" && echo "Note: script uses input (read)" || echo "No input commands found."
grep -En '^\s*[^#]*exit' "$script" && echo "Note: script uses exit statements"
grep -En '^\s*[^#]*rm\s' "$script" && echo "Caution: script uses rm command"

echo -e "\nSuggestions:"
echo "- Use 'set -x' at the top of your script to enable debug tracing"
echo "- Add 'set -e' to exit on any error"
echo "- Use 'trap' to clean up or log on exit signals"

echo ""
read -p "Do you want to run the script with 'bash -x' tracing now? (y/n): " choice
if [[ "$choice" == "y" ]]; then
  bash -x "$script"
else
  echo "Skipping execution."
fi
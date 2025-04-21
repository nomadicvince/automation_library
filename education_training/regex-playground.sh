#!/bin/bash
# regex-playground.sh
# Allows user to test regular expressions interactively.

clear
echo "==== Regex Playground ===="
echo "This tool allows you to input a regex pattern and test it against custom text."
echo "Use standard POSIX extended regex syntax."
echo ""

read -p "Enter the regex pattern: " pattern
read -p "Enter the test string or file path: " input

if [[ -f "$input" ]]; then
  echo -e "\nFile detected. Showing matches in file:"
  grep -E --color=always "$pattern" "$input" || echo "No matches found."
else
  echo -e "\nString input detected. Testing against line:"
  echo "$input" | grep -E --color=always "$pattern" || echo "No match."
fi

echo ""
echo "Note: This tool uses grep -E (extended regex)"
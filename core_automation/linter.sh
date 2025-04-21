#!/bin/bash

echo "==== Python Formatter & Linter ===="

read -p "Enter path to your Python file or directory: " target

if ! command -v black &> /dev/null; then
  echo "Installing Black..."
  pip install black
fi

if ! command -v flake8 &> /dev/null; then
  echo "Installing Flake8..."
  pip install flake8
fi

echo "Running black..."
black "$target"

echo "Running flake8..."
flake8 "$target"

echo "Linting and formatting completed."
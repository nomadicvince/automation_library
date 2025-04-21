#!/bin/bash

echo "==== File Encryption/Decryption ===="

read -p "Encrypt or Decrypt? (e/d): " mode
read -p "Enter the full file path: " filepath

if [[ "$mode" == "e" ]]; then
  gpg -c "$filepath"
  echo "File encrypted: ${filepath}.gpg"
elif [[ "$mode" == "d" ]]; then
  gpg "$filepath"
  echo "File decrypted."
else
  echo "Invalid option. Use 'e' to encrypt or 'd' to decrypt."
fi
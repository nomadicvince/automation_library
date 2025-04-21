#!/bin/bash
# ssh-menu.sh

echo "==== SSH Connection Menu ===="

declare -A HOSTS=(
  ["1"]="pi@192.168.1.100"
  ["2"]="fedora@192.168.1.101"
  ["3"]="admin@server.example.com"
)

for key in "${!HOSTS[@]}"; do
  echo "$key) ${HOSTS[$key]}"
done

echo "q) Quit"
read -p "Choose a server to connect to: " choice

if [[ "$choice" == "q" ]]; then
  echo "Exiting."
  exit 0
elif [[ -n "${HOSTS[$choice]}" ]]; then
  ssh "${HOSTS[$choice]}"
else
  echo "Invalid option."
fi
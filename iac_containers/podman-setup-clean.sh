#!/bin/bash
# podman-setup-clean.sh

echo "==== Podman Quick Setup & Cleanup ===="

read -p "Enter container image to run (e.g., fedora, nginx): " image
read -p "Enter container name: " name

echo "Creating and starting container..."
podman run -dit --name "$name" "$image"

echo "Container $name is running."

read -p "Do you want to clean up stopped containers and unused images? (y/n): " cleanup
if [[ "$cleanup" == "y" ]]; then
  podman container prune -f
  podman image prune -f
  echo "Podman cleanup complete."
fi
#!/bin/bash

echo "==== Systemd Service Manager ===="

read -p "Enter the name of the service (e.g., sshd): " service

if ! systemctl list-unit-files | grep -q "$service"; then
  echo "Error: $service not found. Exiting."
  exit 1
fi

read -p "Choose action (start/stop/restart/status): " action

case "$action" in
  start|stop|restart|status)
    sudo systemctl $action $service
    ;;
  *)
    echo "Invalid action. Please use start, stop, restart, or status."
    ;;
esac
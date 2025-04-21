#!/bin/bash
# ansible-runner.sh

echo "==== Ansible Playbook Runner ===="

PLAYBOOK_DIR="$HOME/ansible/playbooks"

if [[ ! -d "$PLAYBOOK_DIR" ]]; then
  echo "Playbook directory not found at $PLAYBOOK_DIR"
  exit 1
fi

PS3="Select a playbook to run: "
select playbook in "$PLAYBOOK_DIR"/*.yml "Quit"; do
  if [[ "$playbook" == "Quit" ]]; then
    echo "Exiting."
    break
  elif [[ -f "$playbook" ]]; then
    ansible-playbook "$playbook" -K
    break
  else
    echo "Invalid selection."
  fi
done
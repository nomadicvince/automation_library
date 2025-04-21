
#!/bin/bash
# alias-manager.sh
# Manage Bash/Zsh aliases with logging

echo "==== Shell Alias Manager ===="

SCRIPT_DIR="$1"
LOG_FILE="$HOME/.alias-manager.log"

if [[ -z "$SCRIPT_DIR" || ! -d "$SCRIPT_DIR" ]]; then
  echo "Usage: $0 /path/to/scripts"
  exit 1
fi

# Choose mode
echo ""
echo "Do you want to (a)dd or (r)emove aliases?"
read -p "[a/r]: " mode

if [[ "$mode" != "a" && "$mode" != "r" ]]; then
  echo "Invalid mode. Use 'a' to add or 'r' to remove."
  exit 1
fi

# Select shell config
echo ""
echo "Choose your shell config file:"
select shell_file in "$HOME/.bashrc" "$HOME/.zshrc" "Quit"; do
  case $REPLY in
    1|2)
      SHELL_RC="$shell_file"
      break
      ;;
    3)
      echo "Exiting."
      exit 0
      ;;
    *)
      echo "Invalid selection."
      ;;
  esac
done

echo ""
echo "Target shell config: $SHELL_RC"
echo "Logging to: $LOG_FILE"

log_action() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

if [[ "$mode" == "a" ]]; then
  echo "# --- Aliases for automation scripts ---" >> "$SHELL_RC"

  for script in "$SCRIPT_DIR"/*.sh; do
    [[ -f "$script" ]] || continue

    echo ""
    echo "Found: $(basename "$script")"
    read -p "Enter alias for this script (or leave blank to skip): " alias_name

    if [[ -z "$alias_name" ]]; then
      echo "Skipped."
      continue
    fi

    full_path=$(realpath "$script")

    # Remove duplicates
    sed -i "/alias $alias_name=/d" "$SHELL_RC"

    echo "alias $alias_name='bash \"$full_path\"'" >> "$SHELL_RC"
    echo "Alias added: $alias_name -> $full_path"
    log_action "Added alias: $alias_name -> $full_path to $SHELL_RC"
  done

elif [[ "$mode" == "r" ]]; then
  echo ""
  echo "Enter aliases to remove (separated by space):"
  read -a remove_aliases

  for alias in "${remove_aliases[@]}"; do
    sed -i "/alias $alias=/d" "$SHELL_RC"
    echo "Removed alias: $alias"
    log_action "Removed alias: $alias from $SHELL_RC"
  done
fi

echo ""
echo "Done. Run: source $SHELL_RC to apply changes."
______

chmod +x alias-manager.sh
./alias-manager.sh /home/$USER/scripts
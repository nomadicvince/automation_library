#!/bin/bash
# linux-command-of-the-day.sh
# Displays a random Linux command with usage examples and explanation.

clear
echo "==== Linux Command of the Day ===="

declare -A commands=(
  [ls]="List files and directories\nExample: ls -lah\nShows detailed, human-readable list of files."
  [cd]="Change directory\nExample: cd /etc\nMoves into the /etc directory."
  [pwd]="Print current working directory\nExample: pwd\nDisplays your current directory."
  [mkdir]="Make directories\nExample: mkdir projects/new\nCreates a nested directory."
  [rm]="Remove files or directories\nExample: rm -rf temp/\nDeletes the folder and its contents recursively."
  [chmod]="Change file permissions\nExample: chmod +x script.sh\nMakes a script executable."
  [chown]="Change file ownership\nExample: sudo chown user:group file.txt\nChanges the owner and group of a file."
  [grep]="Search file content\nExample: grep 'error' /var/log/syslog\nSearches for 'error' in system logs."
  [find]="Find files and folders\nExample: find . -name '*.sh'\nFinds all shell scripts in current dir."
  [tar]="Archive & compress files\nExample: tar -czf backup.tar.gz folder/\nCreates a compressed archive."
  [top]="View running processes\nExample: top\nInteractive task manager for processes."
  [curl]="Transfer data via HTTP\nExample: curl https://example.com\nFetches page content via HTTP."
  [wget]="Download files\nExample: wget https://example.com/file.zip\nDownloads file from the web."
  [df]="Disk space usage\nExample: df -h\nShows filesystem disk usage in human-readable form."
  [du]="File/folder sizes\nExample: du -sh *\nSummarizes the size of each item in the current dir."
)

keys=("${!commands[@]}")
rand="${keys[$RANDOM % ${#keys[@]}]}"
info="${commands[$rand]}"

echo -e "Command : \e[1m$rand\e[0m"
echo -e "$info"
echo -e "\nTo learn more, run: \e[1mman $rand\e[0m or \e[1m$rand --help\e[0m"
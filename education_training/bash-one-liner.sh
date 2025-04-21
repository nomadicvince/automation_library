#!/bin/bash
# bash-one-liner.sh
# Displays a random Bash one-liner with a description and usage explanation.

clear
echo "==== Bash One-Liner of the Day ===="

declare -A liners=(
  ['find . -type f | wc -l']="Counts all regular files in current and subdirectories.\nUseful for analyzing project size."
  ['du -sh *']="Shows the size of all files and directories in the current directory.\nGreat for checking what's using disk space."
  ['grep -r "TODO" .']="Recursively searches for the word 'TODO' in all files in the current directory.\nGood for code reviews."
  ['ps aux | grep apache']="Filters running processes to only show those related to Apache.\nUseful for monitoring web servers."
  ['cat file.txt | sort | uniq']="Sorts the contents of file.txt and removes duplicate lines.\nClassic for deduplication tasks."
  ['tail -f /var/log/syslog']="Shows real-time log updates as they happen.\nPerfect for watching logs live."
  ['df -h | grep sda']="Displays disk usage only for drives labeled 'sda'.\nHelpful for quickly checking primary drives."
)

keys=("${!liners[@]}")
rand="${keys[$RANDOM % ${#keys[@]}]}"
desc="${liners[$rand]}"

echo -e "Command : \e[1m$rand\e[0m"
echo -e "\n$desc"
echo -e "\nTip: Try copying the command and running it in your terminal."
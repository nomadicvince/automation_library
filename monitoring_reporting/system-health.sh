#!/bin/bash
# system-health.sh
# Displays system health stats including uptime, load, memory, disk, and top processes.

echo "==== System Health Summary ===="

# Display system uptime
echo -e "\n[+] Uptime:"
uptime -p

# Show CPU load averages
echo -e "\n[+] CPU Load Averages:"
cat /proc/loadavg

# Show memory usage
echo -e "\n[+] Memory Usage:"
free -h

# Show root filesystem disk usage
echo -e "\n[+] Disk Usage (/):"
df -h /

# Show top 5 processes by CPU
echo -e "\n[+] Top 5 CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
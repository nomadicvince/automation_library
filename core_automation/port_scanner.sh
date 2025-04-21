#!/bin/bash

echo "==== Nmap Port Scanner ===="

read -p "Enter target IP or domain (e.g., 192.168.1.1 or example.com): " target
read -p "Enter port range (e.g., 1-1000): " ports

if ! command -v nmap &> /dev/null; then
  echo "nmap is not installed. Installing..."
  sudo dnf install -y nmap
fi

nmap -p $ports $target
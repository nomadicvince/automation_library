#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Input the username
read -p "Enter username: " username

# Create user
useradd -m "$username"

# Set password for the new user
passwd "$username"

# Display user creation confirmation
echo "User $username created successfully"
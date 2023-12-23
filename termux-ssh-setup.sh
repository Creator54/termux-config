#!/usr/bin/env bash

# Define colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print messages with color
print_message() {
	echo -e "${GREEN}[INFO]${NC} $1"
}

# Update and upgrade packages
print_message "Updating and upgrading packages..."
pkg update -y
pkg upgrade -y

# Prompt password for the user
user_password="jack@1234"
print_message "Setting up password for the user..."
echo -e "$user_password\n$user_password" | passwd

# Install openssh without prompts
print_message "Installing OpenSSH..."
export DEBIAN_FRONTEND=noninteractive
echo "Y\nY\nY" | pkg install -y openssh

# Generate SSH host keys
print_message "Generating SSH host keys..."
ssh-keygen -A

# Start the SSH server
print_message "Starting the SSH server..."
sshd

print_message "User setup is complete."

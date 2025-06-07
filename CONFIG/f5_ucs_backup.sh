#!/bin/bash

# Set variables
UCS_FILENAME="f5_backup_`date +%Y%m%d_%H%M`".ucs
BACKUP_DIR="/var/tmp"
JUMPHOST_USER="your_jump_host_username"
JUMPHOST_IP="192.168.1.100" # Replace with your jump host IP
JUMPHOST_DEST_DIR="/home/your_jump_host_user/backups/" # Replace with desired location

# 1. Create UCS Backup
tmsh save /sys ucs "$BACKUP_DIR/$UCS_FILENAME"

# 2. Transfer to Jump Host
scp "$BACKUP_DIR/$UCS_FILENAME" "$JUMPHOST_USER@$JUMPHOST_IP:$JUMPHOST_DEST_DIR"

# Optional: You can add a step to transfer from the jump host to your final destination here
# Example:
# scp "$JUMPHOST_USER@$JUMPHOST_IP:$JUMPHOST_DEST_DIR/$UCS_FILENAME" "your_final_destination_user@your_final_destination_ip:/path/to/destination"

# 3. Optional cleanup
# rm -f "$BACKUP_DIR/$UCS_FILENAME"

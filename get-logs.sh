#!/bin/bash


# Define variables
REMOTE_USER="odroid"
REMOTE_HOST="192.168.12.1"
REMOTE_DIR="~/acsl-flight-stack/src/acsl_flight/flight_log/"
LOCAL_DIR="$(pwd)/"  # Automatically set to the script's execution directory

# Print that you are copying files
echo "Logs are being copied from: $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Execute scp command
sshpass -p 'odroid' scp -rp "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR" "$LOCAL_DIR"

# Print the destination directory
echo "Logs have been copied to: $LOCAL_DIR"

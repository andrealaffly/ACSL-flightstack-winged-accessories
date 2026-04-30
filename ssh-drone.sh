#!/bin/bash

# Variables
USERNAME="odroid"
IP="192.168.12.1"
PASSWORD="odroid"

# SSH command
sshpass -p "$PASSWORD" ssh "$USERNAME"@"$IP"

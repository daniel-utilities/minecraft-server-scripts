#!/bin/bash

echo "Starting the Minecraft Server system service..."
sudo systemctl start minecraft
echo ""
echo "Please use ./console.sh to view the Minecraft console."
echo "If the server needs to be stopped for any reason, use"
echo "./stop.sh instead of killing the process or issuing /stop"
echo


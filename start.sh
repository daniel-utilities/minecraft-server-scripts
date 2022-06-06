#!/usr/bin/env bash

echo "Starting the Minecraft Server..."
systemctl --user start minecraft
echo ""
systemctl --user status minecraft
echo ""
echo "Please use ./console.sh to view the Minecraft console."
echo "If the server needs to be stopped for any reason, use ./stop.sh instead of killing the process or issuing /stop"
echo


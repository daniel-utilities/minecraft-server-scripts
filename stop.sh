#!/usr/bin/env bash

echo "Stopping the Minecraft server..."
systemctl --user stop minecraft
echo ""
systemctl --user status minecraft
echo ""
echo "Please use ./start.sh to restart the server instead of launching Java through another method."
echo ""

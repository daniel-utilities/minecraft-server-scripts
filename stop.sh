#!/bin/bash

echo "Stopping the Minecraft system service..."
sudo systemctl stop minecraft
echo ""
echo "Please use ./start.sh to restart the server"
echo "instead of launching Java through another method."
echo ""

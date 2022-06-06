#!/usr/bin/env bash
SCREEN_SESSION=minecraft

echo ""
echo "IMPORTANT:"
echo ""
echo "You are about to connect to the session containing the Minecraft server process."
echo " - Do NOT use the /stop command here. Doing so will desync with the system service managing this server. Instead, always run ./stop.sh"
echo " - Do NOT use CTRL-C to kill the process. Doing so may result in data loss."
echo " - ALWAYS use \"CTRL-A + d\" to disconnect from the session."
echo ""
read -r -p "Continue? (Y/N): " 
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    echo "Connecting to screen session for Minecraft..."
    echo ""
    /usr/bin/screen -r $SCREEN_SESSION 

fi
#!/bin/bash
SCREEN_SESSION=minecraft
RUNAS=uksc

# If started as root, then re-start as user $RUNAS:
if [ "$(id -u)" -eq 0 ]; then
    exec sudo -H -u $RUNAS $0 "$@"
fi

echo ""
echo "IMPORTANT:"
echo ""
echo "You are about to connect to the Screen session containing the Minecraft server process."
echo " - Do NOT use /stop here. Doing so will desync with the system service managing this server. Instead, always run ./stop.sh"
echo " - Do NOT close your terminal while viewing the console. Doing so will forcibly kill the process and may result in data loss. Instead, always use \"CTRL-A d\" to disconnect from the Screen session before closing the terminal."
echo ""
read -p "Press ENTER to continue..."
echo "Connecting to screen session for Minecraft..."
echo ""
/usr/bin/screen -r $SCREEN_SESSION 

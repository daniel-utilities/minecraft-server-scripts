#!/bin/bash
SCREEN_SESSION=minecraft
RUNAS=uksc

# If started as root, then re-start as user $RUNAS:
if [ "$(id -u)" -eq 0 ]; then
    exec sudo -H -u $RUNAS "$0" "$@"
fi

/usr/bin/screen -p 0 -S $SCREEN_SESSION -X eval "stuff \"$@\"\015"

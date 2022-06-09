#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
SERVER_ROOT="$(dirname "$SCRIPT_DIR")"
JARFILE="$SERVER_ROOT/server.jar"
JAVA_HOME="/opt/jdk-17"
SCREEN_SESSION=minecraft

cd "$SERVER_ROOT"
/usr/bin/screen -p 0 -S $SCREEN_SESSION -X eval 'stuff "say Server is restarting in 15 seconds..."\015'
sleep 5
/usr/bin/screen -p 0 -S $SCREEN_SESSION -X eval 'stuff "say Server is restarting in 10 seconds..."\015'
sleep 5
/usr/bin/screen -p 0 -S $SCREEN_SESSION -X eval 'stuff "say Server is restarting in 5 seconds..."\015'
sleep 5
/usr/bin/screen -p 0 -S $SCREEN_SESSION -X eval 'stuff "stop"\015'

#Wait for screen session to terminate
while screen -list | grep -q $SCREEN_SESSION
do
    sleep 1
done


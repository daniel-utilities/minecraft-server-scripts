#!/bin/sh
JAVA_HOME=/opt/jdk-17
SCREEN_SESSION=minecraft
RUNAS=uksc

# If started as root, then re-start as user $RUNAS:
if [ "$(id -u)" -eq 0 ]; then
    exec sudo -H -u $RUNAS $0 "$@"
fi


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


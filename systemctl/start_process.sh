#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
SERVER_ROOT="$(dirname "$SCRIPT_DIR")"
JARFILE="$SERVER_ROOT/server.jar"
JAVA_HOME="/opt/jdk-17"
SCREEN_SESSION=minecraft

cd "$SERVER_ROOT"
/usr/bin/screen -dmS $SCREEN_SESSION "$JAVA_HOME/bin/java" -Xms6G -Xmx6G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dlog4j2.formatMsgNoLookups=true -jar "$JARFILE" nogui

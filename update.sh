#!/bin/bash

PAPER_ROOT=./Paper
JAVA_HOME=/opt/jdk-17
BUILD_DIR="$PAPER_ROOT/build/libs"
OUTPUT_JAR="./paper.jar"

./stop.sh

cd $PAPER_ROOT
git pull
./gradlew applyPatches
./gradlew createReobfBundlerJar
cd ..

# Find latest version in the build folder
unset -v LATEST
for file in "$BUILD_DIR"/*; do
  [[ $file -nt $LATEST ]] && LATEST=$file
done

echo -e "Replacing \"paper.jar\" with most recent build:\n$LATEST"
cp $LATEST $OUTPUT_JAR

echo ""
echo "Please run ./start.sh to start the server, and ./console.sh to view the console."
echo ""

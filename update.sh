#!/usr/bin/env bash
WORKING_DIR="$PWD"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

PAPER_ROOT="$SCRIPT_DIR/Paper"
BUILD_DIR="$PAPER_ROOT/build/libs"
OUTPUT_JAR="$SCRIPT_DIR/server.jar"

"$SCRIPT_DIR/stop.sh" > /dev/null

cd "$SCRIPT_DIR"
if [ ! -d "Paper" ]; then
    git clone https://github.com/PaperMC/Paper.git
else
    cd "Paper" && git pull origin master
fi
cd "$PAPER_ROOT"
git pull origin master
./gradlew applyPatches
./gradlew createReobfBundlerJar

# Find latest version in the build folder
cd "$BUILD_DIR/.."
unset -v LATEST
for file in "$BUILD_DIR"/*; do
  [[ "$file" -nt "$LATEST" ]] && LATEST="$file"
done

echo "Replacing $OUTPUT_JAR with most recent build: $LATEST"
cp -f "$LATEST" "$OUTPUT_JAR"

echo ""
echo "Please run ./start.sh to start the server, and ./console.sh to view the console."
echo ""

cd "$WORKING_DIR"
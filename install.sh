#!/usr/bin/env bash
WORKING_DIR="$PWD"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Download and unpack OpenJDK 17 (Required by Paper Server)
echo
read -r -p "Install OpenJDK 17? (Y/N): " 
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    JDK_ZIP="openjdk-17_linux-x64_bin.tar.gz"
    [ ! -f "$JDK_ZIP" ] && wget "https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/$JDK_ZIP"
    sudo tar xvf "$JDK_ZIP"
    sudo mv "./jdk-17" "/opt/"
    sudo rm -rf "./jdk-17"
    rm -i "$JDK_ZIP"

    # Add Java executables to PATH
    JAVA_HOME="/opt/jdk-17"
    APPEND_1="export PATH=\"\$PATH:$JAVA_HOME/bin\""
    APPEND_2="export JAVA_HOME=\"$JAVA_HOME\""
    FILE="/etc/bash.bashrc"
    sudo grep -qxF "$APPEND_1" "$FILE" || echo "$APPEND_1" | sudo tee -a "$FILE" > /dev/null
    sudo grep -qxF "$APPEND_1" "$FILE" || echo "$APPEND_1" | sudo tee -a "$FILE" > /dev/null
    source /etc/bash.bashrc

    echo "Java has been installed to $JAVA_HOME"
    java -version
    echo

fi

# Install Gradle build system
echo
read -r -p "Install Gradle 7.4.2? (Y/N): " 
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    sudo apt install unzip
    GRADLE_ZIP="gradle-7.4.2-bin.zip"
    [ ! -f "$GRADLE_ZIP" ] && wget "https://downloads.gradle-dn.com/distributions/$GRADLE_ZIP"
    sudo mkdir "/opt/gradle"
    sudo unzip "$GRADLE_ZIP" -d "/opt/gradle"
    rm -i "$GRADLE_ZIP"

    # Add Gradle executables to PATH
    GRADLE_HOME="/opt/gradle/gradle-7.3.1"
    FILENAME="/etc/bash.bashrc"
    APPEND_1="export PATH=\"\$PATH:$GRADLE_HOME/bin\""
    APPEND_2="export GRADLE_HOME=\"$GRADLE_HOME\""
    FILE="/etc/bash.bashrc"
    sudo grep -qxF "$APPEND_1" "$FILE" || echo "$APPEND_1" | sudo tee -a "$FILE" > /dev/null
    sudo grep -qxF "$APPEND_1" "$FILE" || echo "$APPEND_1" | sudo tee -a "$FILE" > /dev/null
    source /etc/bash.bashrc

    echo "Gradle has been installed to $GRADLE_HOME"
    gradle -version
    echo

fi

# Clone Paper Minecraft Server Repo
echo
read -r -p "Download and build latest Paper MC Server? (Y/N): " 
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    "$SCRIPT_DIR/update.sh"

fi

# Set to run at boot
sudo apt-get install libpam-systemd
mkdir -p "~/.config/systemd/user"
cp -f "$SCRIPT_DIR/systemctl/minecraft.service" "~/.config/systemd/user/minecraft.service"
systemctl --user enable minecraft
loginctl enable-linger $USER
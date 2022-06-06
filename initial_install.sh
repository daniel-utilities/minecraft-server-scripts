#!/bin/bash

# Download and unpack OpenJDK 17 (Required by Paper Server)
echo "Press any key to install OpenJDK 17..."
read
JDK_ZIP="openjdk-17_linux-x64_bin.tar.gz"
[ ! -f $JDK_ZIP ] && wget "https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/$JDK_ZIP"
sudo tar xvf $JDK_ZIP 
sudo mv jdk-17 /opt/
sudo rm -rf jdk-17
rm -i $JDK_ZIP

# Add Java executables to PATH
JAVA_HOME="/opt/jdk-17"
FILENAME="/etc/bash.bashrc"
APPEND_1="export PATH=\$PATH:$JAVA_HOME/bin"
APPEND_2="export JAVA_HOME=$JAVA_HOME"

grep -qxF "$APPEND_1" $FILENAME || echo -e $APPEND_1 | sudo tee -a $FILENAME
grep -qxF "$APPEND_2" $FILENAME || echo -e $APPEND_2 | sudo tee -a $FILENAME
eval $APPEND_1
eval $APPEND_2

echo "Java has been installed to $JAVA_HOME"
java -version
echo

# Install Gradle build system
echo "Press any key to install Gradle 7.0..."
read

sudo apt install unzip
GRADLE_ZIP="gradle-7.3.1-bin.zip"
[ ! -f $GRADLE_ZIP ] && wget "https://downloads.gradle-dn.com/distributions/$GRADLE_ZIP"
sudo mkdir /opt/gradle
sudo unzip $GRADLE_ZIP -d /opt/gradle
rm -i $GRADLE_ZIP

# Add Gradle executables to PATH
GRADLE_HOME="/opt/gradle/gradle-7.3.1"
FILENAME="/etc/bash.bashrc"
APPEND_1="export PATH=\$PATH:$GRADLE_HOME/bin"
APPEND_2="export GRADLE_HOME=$GRADLE_HOME"

grep -qxF "$APPEND_1" $FILENAME || echo -e $APPEND_1 | sudo tee -a $FILENAME
grep -qxF "$APPEND_2" $FILENAME || echo -e $APPEND_2 | sudo tee -a $FILENAME
eval $APPEND_1
eval $APPEND_2

echo "Gradle has been installed to $GRADLE_HOME"
gradle -version
echo

# Clone Paper Minecraft Server Repo
echo "Press any key to download Paper source repo..."
read
read -p "Enter an email address for Github." USEREMAIL
git config --global user.email "$USEREMAIL"
git config --global user.name "$USER"

git clone https://github.com/PaperMC/Paper.git

echo -e "Please restart terminal session and then run \"paper_update.sh\"."
echo



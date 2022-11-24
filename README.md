# minecraft-server-scripts
Bash scripts for installing and administering a high-performance [PaperMC](https://papermc.io/) Minecraft server on Ubuntu (headless).

## Installation
Clone this repo to your system *with submodules*.
```
git clone --recursive https://github.com/daniel-utilities/minecraft-server-scripts.git
cd minecraft-server-scripts
```
Then run the installation script:
```
chmod +x install.sh
./install.sh
```


This installs the latest version of Paper MC to ~/minecraft, along with required build and runtime dependencies (OpenJDK 17, Gradle 7).
Currently this install directory cannot be changed.

The server's configuration is isolated to the user, so one system can run multiple servers if each is installed to a different user.

The Minecraft server is managed through a systemd user service so it can (optionally) be started automatically at boot and shutdown gracefully at system shutdown, without risking data loss. The configuration is handled by the install script.

The following scripts will be available inside the new ~/minecraft folder:

 - `start.sh` : Starts the Minecraft server in the background.
 - `stop.sh` : Counts down 15 seconds in the game, then saves and closes the server.
 - `status.sh` : Checks if the server is currently running.
 - `console.sh` : Connect directly to the server console. Allows to run commands as server OP. Press CTRL-A + d  to quit without killing the server process.
 - `update.sh` : Automatically downloads and builds the latest version of Paper.

It highly recommended to use the above scripts instead of starting/stopping the server manually, or data loss may occur on system shutdown.


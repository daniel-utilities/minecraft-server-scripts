# minecraft-server-scripts
Bash scripts for installing and administering a high-performance [PaperMC](https://papermc.io/) Minecraft server on Ubuntu (headless).

# Installation
Download the repo, then run ./install.sh:

```
git clone https://github.com/danielk-98/minecraft-server-scripts.git
cd minecraft-server-scripts
chmod +x ./install.sh
./install.sh
```


This installs the latest version of Paper MC to ~/minecraft, along with required build and runtime dependencies (OpenJDK 17, Gradle 7).
Currently the install directory cannot be changed, but since the server is isolated to this user multiple servers can be installed on different users (provided enough RAM and different ports!).

The Minecraft server is managed through a systemd user service so it can (optionally) be started automatically at boot and shutdown gracefully at system shutdown, without risking data loss. The configuration is handled by the install script.

The following scripts will be available inside the new ~/minecraft folder:

 - `start.sh` : Starts the Minecraft server in the background.
 - `stop.sh` : Counts down 15 seconds in the game, then saves and closes the server.
 - `status.sh` : Checks if the server is currently running.
 - `console.sh` : Connect directly to the server console. Allows to run commands as server OP. Press CTRL-A + d  to quit without killing the server process.
 - `update.sh` : Automatically downloads and builds the latest version of Paper.

It highly recommended to use the above scripts instead of starting/stopping the server manually, or data loss may occur on system shutdown.


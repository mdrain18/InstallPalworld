# Palworld Server Installation Script

This README explains the functionality of the `install_palworld.bat` script, designed for setting up a Palworld server.

## Overview

The `install_palworld.bat` script automates the process of installing SteamCMD, setting up a Palworld server, and preparing necessary scripts for server management. The script performs several checks to ensure that redundant installations do not occur if certain components are already installed.

## How It Works

1. **SteamCMD Installation Check**: The script first checks if SteamCMD is already installed by looking for `steam.dll` and `crashhandler.dll` in the `steamcmd` folder. If not found, it proceeds to install SteamCMD.

2. **Palworld Installation Check**: The script checks if Palworld is already installed by verifying the existence of specific directories (`Engine`, `Pal`, `steamapps`) and a file (`tier0_s.dll`) in the Palworld folder.

3. **Server Installation**: If Palworld is not already installed, the script creates an `install_server.bat` file in the Palworld folder. This batch file is then executed to install the Palworld server.

4. **Server Start Script**: The script also creates a `start_server.bat` file for running the Palworld server.

## Manual SteamCMD Installation

If you prefer to manually install SteamCMD, follow these steps:

1. **Download SteamCMD**: Go to the [SteamCMD Official Page](https://developer.valvesoftware.com/wiki/SteamCMD) and download the SteamCMD package.

2. **Unzip and Place SteamCMD**: Unzip the downloaded package and place `steamcmd.exe` in the same folder as the `install_palworld.bat` file.

3. **Prepare the Batch File**:
    - Copy the code for `install_palworld.bat` from the repository.
    - Paste it into a new text file.
    - Save the file with the name `install_palworld.bat`.

4. **Run the Script**: Double-click `install_palworld.bat` to start the installation process.

## Repository Cloning (Alternative)

As an alternative, you can clone the entire repository which includes the `install_palworld.bat` file. This is useful if you want to obtain the latest version of the script along with any other related files.

## Notes

- Ensure you have the necessary permissions to create directories and files in the script's location.
- The script assumes that the presence of certain files is an indication of a successful installation. Make sure these files are not manually altered or removed.

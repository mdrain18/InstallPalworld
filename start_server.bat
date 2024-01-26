@echo off

REM Set the current directory to the location of the batch file
cd %~dp0

REM Check if ServerBackups folder exists, if not create it
if not exist "ServerBackups" (
    md "ServerBackups"
)

REM Create a backup of the specified folder
echo Creating a backup...
PowerShell.exe -command "Compress-Archive -Path '.\Pal\Saved\Config\WindowsServer' -DestinationPath '.\ServerBackups\backup_%date:~-4,4%-%date:~-10,2%-%date:~-7,2%_%time:~0,2%%time:~3,2%.zip'"

REM Update the server
echo Updating the server...
..\steamcmd\steamcmd.exe +login anonymous +force_install_dir ".\Palworld" +app_update 2394010 validate +quit

REM Update settings files
echo Updating settings files...
copy /Y ".\updateSettings\*.ini" ".\Pal\Saved\Config\WindowsServer"

REM Restart the server
echo Starting Palworld server...
PalServer.exe -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -port=8211 -players=32

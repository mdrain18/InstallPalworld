@echo off

REM Check if steamcmd folder already exists and has necessary files
if exist "steamcmd\steam.dll" (
    if exist "steamcmd\crashhandler.dll" (
        echo steamcmd is already installed.
        goto CheckPalworld
    )
)

REM Install steamcmd
echo Installing steamcmd...
md steamcmd
copy steamcmd.exe steamcmd
cd steamcmd
echo Running steamcmd...
steamcmd.exe
cd ..

:CheckPalworld
REM Check if Palworld is already installed
if exist "Palworld\Engine" (
    if exist "Palworld\Pal" (
        if exist "Palworld\steamapps" (
            if exist "Palworld\tier0_s.dll" (
                echo Palworld is already installed.
                goto ModifyEngineIni
            )
        )
    )
)

REM Create Palworld folder
if not exist "Palworld" (
    md Palworld
)

REM Create install_server.bat in Palworld folder
echo @echo off > Palworld\install_server.bat
echo ..\steamcmd\steamcmd.exe +login anonymous +force_install_dir "..\Palworld" +app_update 2394010 validate +quit >> Palworld\install_server.bat

REM Run install_server.bat to install the server
cd Palworld
call install_server.bat

REM Create start_server.bat in Palworld folder
echo @echo off > start_server.bat
echo ..\steamcmd\steamcmd.exe +login anonymous +force_install_dir "D:\Palworld" +app_update 2394010 validate +quit >> start_server.bat

:ModifyEngineIni
REM Modify Engine.ini to increase server FPS
echo Modifying Engine.ini to increase server FPS...
echo. >> Palworld\Pal\Saved\Config\LinuxServer\Engine.ini
echo [/Script/OnlineSubsystemUtils.IpNetDriver] >> Palworld\Pal\Saved\Config\LinuxServer\Engine.ini
echo NetServerMaxTickRate=60 >> Palworld\Pal\Saved\Config\LinuxServer\Engine.ini

:End
cd ..

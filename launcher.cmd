:: Download and run the system debloat scripts directly from GitHub
:: Created by: Alex Ivantsov (https://github.com/Exploitacious/Windows_Toolz/tree/main/System_Debloat)
:: Adapted by: Rafael Pellicer | TICnine

@echo off

:: Checking for Administrator elevation.

        openfiles>nul 2>&1

        if %errorlevel% EQU 0 goto :Download

        echo.
        echo.
        echo.
        echo.
        echo.
        echo.    You are not running as Administrator.
        echo.    This script cannot do it's job without elevation.
        echo.
        echo.    You need run this tool as Administrator.
        echo.

    exit


:: Download Required Files from https://github.com/TICnine/deploy
:Download

    PowerShell -Command "mkdir C:\Temp\Cleanup -erroraction silentlycontinue"
    
    cd "C:\Temp\Cleanup"

    PowerShell -executionpolicy bypass -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/TICnine/cleanupSYS.ps1', 'cleanupSYS.ps1')"

    PowerShell -executionpolicy bypass -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/TICnine/cleanupUSR.ps1', 'cleanupUSR.ps1')"
    
    PowerShell -executionpolicy bypass -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/TICnine/FirstLogon.bat', 'FirstLogon.bat')"



:: Start Running the SYSTEM DEBLOAT scripts
:RunScript

    SET ThisScriptsDirectory=C:\Temp\Cleanup\
    SET PowerShellScriptPath=%ThisScriptsDirectory%SYSTEM-Debloat-MAIN.ps1
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";
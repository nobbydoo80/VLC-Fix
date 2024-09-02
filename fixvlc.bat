@echo off
echo =================================================
echo VLC Troubleshooting Script
echo =================================================
echo.

REM Step 1: Close VLC if it's running
echo Closing VLC if running...
taskkill /IM vlc.exe /F
echo.

REM Step 2: Uninstall VLC
echo Uninstalling VLC...
REM Note: This uses WMIC to uninstall VLC; requires administrative privileges.
wmic product where "name like 'VLC media player%%'" call uninstall /nointeractive
echo.

REM Step 3: Remove VLC Configuration Files
echo Removing VLC configuration files...
rmdir /S /Q "%APPDATA%\vlc"
echo.

REM Step 4: Reinstall VLC
echo Reinstalling VLC...
echo Please download the latest VLC installer from the official website:
echo https://www.videolan.org/vlc/
echo After downloading, run the installer manually.
pause
echo.

REM Step 5: Check for VLC Updates and Reset Plugins
echo Running VLC in Safe Mode to reset plugins cache...
echo Note: This command will open VLC in safe mode.
echo Close VLC when finished to continue.
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" -I qt --no-plugins-cache --reset-plugins-cache
echo.

REM Step 6: Switch to Default Interface
echo Switching VLC back to the default interface...
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" -I qt
echo.

REM Completion Message
echo =================================================
echo VLC Troubleshooting Complete!
echo Please check if the missing functionalities are restored.
echo If problems persist, consider using an older version or contact VLC support.
echo =================================================
pause

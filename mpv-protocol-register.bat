@echo off
setlocal EnableDelayedExpansion

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Error: This script requires Administrator privileges.
    echo Please right-click on this file and select "Run as Administrator".
    echo.
    pause
    exit /b 1
)

echo Registering mpv:// protocol handler...
echo.

:: Register protocol handler
reg add "HKCR\mpv" /ve /t REG_SZ /d "URL:mpv Protocol" /f

reg add "HKCR\mpv" /v "URL Protocol" /t REG_SZ /d "" /f

:: Set DefaultIcon based on mpv.exe availability
if exist "%~dp0mpv.exe" (
    reg add "HKCR\mpv\DefaultIcon" /ve /t REG_SZ /d "\"%~dp0mpv.exe\",0" /f
) else (
    reg add "HKCR\mpv\DefaultIcon" /ve /t REG_SZ /d "mpv.exe,0" /f
)

reg add "HKCR\mpv\shell\open\command" /ve /t REG_SZ /d "\"%~dp0mpv-protocol.bat\" \"%%1\"" /f

:: Verify registration
reg query "HKCR\mpv\shell\open\command" /ve
if %errorLevel% neq 0 (
    echo Error: Failed to verify registration.
    pause
    exit /b 1
)

echo Successfully registered mpv:// protocol handler!
echo You can now use mpv:// links in your browser.
echo.
pause
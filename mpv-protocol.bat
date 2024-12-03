@echo off
setlocal EnableDelayedExpansion

set "url=%~1"
echo Input URL: !url!

:: Remove mpv:// prefix
set "url=!url:mpv://=!"
echo After removing prefix: !url!

:: Fix Chrome 130+ format
set "needfix="
echo !url! | findstr /i "^http//" >nul && set "needfix=1"
echo !url! | findstr /i "^https://" >nul && set "needfix=1"
if defined needfix (
    echo Fixing Chrome 130+ format
    set "url=!url:http//=http://!"
    set "url=!url:https//=https://!"
    echo After fixing: !url!
)

:: Ensure spaces are encoded
set "url=!url: =%%20!"
echo Final URL: !url!

:: Launch MPV
echo Launching MPV...
if exist "%~dp0mpv.exe" (
    echo Using local mpv.exe
    start "" "%~dp0mpv.exe" "!url!"
) else (
    echo Using global mpv.exe
    start "" mpv "!url!"
)

:: Wait for MPV to initialize (200ms delay, no output)
@REM >nul ping -n 1 -w 200 127.0.0.1
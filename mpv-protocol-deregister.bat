@echo off
@echo.
echo If you see "ERROR: Access is denied." then you need to right click and use "Run as Administrator".
@echo.
echo Removing mpv:// association...

reg delete HKCR\mpv /f

@echo.
pause
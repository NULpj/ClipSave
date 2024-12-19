@echo off
setlocal enabledelayedexpansion

set "outputFile=clipboard_log.txt"

set "previousClipboard="

:loop
for /f "delims=" %%A in ('powershell Get-Clipboard') do (
    set "currentClipboard=%%A"
)

for /f "tokens=1,2 delims= " %%a in ("%date% %time%") do (
    set timestamp=%%a %%b
)

)

if not "!currentClipboard!"=="!previousClipboard!" (
    echo [%timestamp%] !currentClipboard! >> "%outputFile%"
    echo. >> "%outputFile%"
	echo [%timestamp%] !currentClipboard!
    echo.
    set "previousClipboard=!currentClipboard!"
)

timeout /t 1 > nul
goto loop



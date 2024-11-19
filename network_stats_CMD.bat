@echo off
mode 50,20
title Network Stats
echo Loading Network Informations...
timeout /t 1 >nul
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set adapter=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "State"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal=%%a
for /f "tokens=4 delims==" %%a in ('ping -n 2 8.8.8.8 ^| find "Average"') do set ping=%%a
for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Bytes"') do set rbyte=%%a
for /f "tokens=3 delims= " %%a in ('netstat -e ^| find "Bytes"') do set sbyte=%%a
cls
echo  Network Status:
echo -------------
echo  SSID:%ssid%
echo  NIC:%adapter%
echo  State:%state%
echo  Signal:%signal%
echo.
echo.
echo  Speed:
echo -------------
echo  Ping:%ping%
echo  Received:%rbyte%
echo  Sent:%sbyte%
goto loop


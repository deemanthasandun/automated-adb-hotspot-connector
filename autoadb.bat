@echo off
echo Disconnecting old connections...
adb disconnect
echo Setting up connected device
adb tcpip 5555
echo Waiting for device to initialize
timeout 3
FOR /F "tokens=2" %%G IN ('adb shell ip addr show ap0 ^|find "inet "') DO set ipfull=%%G
FOR /F "tokens=1 delims=/" %%G in ("%ipfull%") DO set ip=%%G
echo Connecting to device with IP %ip%...
adb connect %ip%
echo Disconnect device if connected
pause

rem use wlan0 if device connected via primary wireless LAN interface."WLAN0" is the interface through which the device connects to Wi-Fi networks.
rem use ap0 if device connected via access point (hotspot) functionality

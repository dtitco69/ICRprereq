@echo off

echo Warning! MUST RUN WITH ADMINISTRATOR PRIVILAGES!! This file will disable and stop windows firewall from starting you will need to reboot the PC when done.

pause

echo Only continue if you are sure

pause

net stop MpsSvc

REG add "HKLM\SYSTEM\CurrentControlSet\services\MpsSvc" /v Start /t REG_DWORD /d 4 /f

pause

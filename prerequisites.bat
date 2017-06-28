@echo off

echo Warning! MUST RUN WITH ADMINISTRATOR PRIVILAGES!! This file will disable and stop Windows Firewall and Action Centre from starting, your PC will reboot for the changes to be fully applied.

pause

echo Only continue if you are sure

pause


net stop MpsSvc

REG add "HKLM\SYSTEM\CurrentControlSet\services\MpsSvc" /v Start /t REG_DWORD /d 4 /f

REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /f /v HideSCAHealth /t REG_SZ /d 1

echo Press 'Enter' To restart your PC
pause

shutdown -r -t 00

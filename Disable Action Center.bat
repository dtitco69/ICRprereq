@echo off

echo Warning! MUST RUN WITH ADMINISTRATOR PRIVILAGES!! This file will disable and stop windows Action Centre from starting you will need to reboot the PC when done.

pause

echo Only continue if you are sure

pause

REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /f /v HideSCAHealth /t REG_SZ /d 1

pause

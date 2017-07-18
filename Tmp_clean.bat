@Echo off
cls
cleanmgr /sageset:65535
del /F /S /Q  "%systemroot%\temp\*.*"


del /F /S /Q  "C:\AppData\Local\Microsoft\Windows\History\*.*"
del /F /S /Q  "C:\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\*.*"
del /F /S /Q  "C:\AppData\Local\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\*.*"
del /F /S /Q  "C:\AppData\Local\Microsoft\Windows\Temporary Internet Files\Temporary Internet Files\Content.IE5\*.*"
del /F /S /Q  "C:\AppData\Local\Microsoft\Windows\Temporary Internet Files\Temporary Internet Files\Low\Content.IE5\*.*"

del /F /S /Q  "C:\Users\%UserName%\AppData\Local\Temp\*.*"
del /F /S /Q  "C:\Temp\*.*"
del /F /S /Q  "C:\Users\%UserName%\AppData\Local\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\*.*
del /F /S /Q  "C:\Users\%UserName%\AppData\Local\Microsoft\Windows\History\*.*


::Rem:  No need to duplicate the following section for each registered User
del /F /S /Q  "%homepath%\Cookies\*.*"
del /F /S /Q  "%homepath%\recent\*.*"
del /F /S /Q  "%homepath%\Local Settings\cookies\*.*"

del /F /S /Q  "%homepath%\Local Settings\History\*.*"
del /F /S /Q  "%homepath%\Local Settings\Temp\*.*"
del /F /S /Q  "%homepath%\Local Settings\Temporary Internet Files\Content.IE5\*.*"


del /F /S /Q "C:\$Recycle.Bin.Bin\*.*" 

del /F /S /Q "C:\Recycled\*.*"

cleanmgr /sagerun:65535

@ECHO OFF
setlocal enableextensions enabledelayedexpansion
 
:CHECKOUTLOOK
FOR /F "usebackq" %%I IN (`reg query HKCU\Software\Microsoft\Office\16.0\Outlook\Resiliency\DisabledItems`) DO ( 
    IF %%I NEQ "" GOTO ENABLEOUTADDIN
)

REG QUERY "HKCU\Software\Microsoft\Office\Outlook\Addins\crmaddin.Addin" /v LoadBehavior | Find "0x0"
IF %ERRORLEVEL% == 0 GOTO LOAD
IF %ERRORLEVEL% == 1 GOTO LOAD
IF %ERRORLEVEL% == 2 GOTO LOAD

GOTO EOF
 
:ENABLEOUTADDIN
reg delete HKCU\Software\Microsoft\Office\16.0\Outlook\Resiliency\DisabledItems /va /f
GOTO LOAD

:LOAD
reg add HKCU\Software\Microsoft\Office\Outlook\Addins\crmaddin.Addin /v LoadBehavior /t REG_DWORD /d 3 /f
reg add HKCU\Software\Microsoft\Office\Outlook\Addins\crmaddin.RibbonAddin /v LoadBehaviour /t REG_DWORD /d 3 /f

GOTO EOF
 
:EOF
exit /B
@ECHO OFF
TITLE �̻�
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
taskkill /f /im Xshell* 
sc stop "FlexNet Licensing Service"
sc delete "FlexNet Licensing Service"
PUSHD %~DP0
if /i "%PROCESSOR_IDENTIFIER:~0,3%" == "X86" goto x86
if /i "%PROCESSOR_IDENTIFIER:~0,3%" NEQ "X86" goto x64
:x86
mkdir "%CommonProgramFiles%\NetSarang" 
copy /y XshellCore.tlb "%CommonProgramFiles%\NetSarang"
reg add "HKCU\SOFTWARE\NetSarang\Xshell\6\Personal" /f /v Notified /t REG_DWORD /d "1"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Path /d "%~dp0\"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Type /d "Register"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v RESELLER /d ""
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Company /d "��ɿ˼�����̳"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v UserName /d "roustar31"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Version /d "6.0.0098"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v MagicCode /t reg_binary /d "91eec2eac5b011748b19a847dc3b68f2e20709001200"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v MagicTime /t reg_binary /d "e20709000200120010000f002d00c701"
reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v ProductKey /d "180918-116783-999110"
reg add "HKLM\SOFTWARE\NetSarang\License\6\6" /f /v ProductKey /d "180918-116783-999110"
reg add "HKLM\SOFTWARE\NetSarang\License\6" /f /v ProductKey /d "180918-116783-999110"

reg add "HKCU\SOFTWARE\NetSarang\Xmanager\6\Personal" /f /v Notified /t REG_DWORD /d "1"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v Type /d "Register"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v RESELLER /d ""
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v Company /d "��ɿ˼�����̳"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v UserName /d "roustar31"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v Version /d "6.0.0092"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v MagicCode /t reg_binary /d "91eec2eac5b011748b19a847dc3b68f2e20709001200"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6" /f /v MagicTime /t reg_binary /d "e20709000200120010000f002d00c701"
reg add "HKLM\SOFTWARE\NetSarang\Xmanager\6"  /f /v ProductKey /d "180918-116783-999110"

:x64
mkdir "%CommonProgramFiles(x86)%\NetSarang" 
copy /y XshellCore.tlb "%CommonProgramFiles(x86)%\NetSarang"
reg add "HKCU\SOFTWARE\NetSarang\Xshell\6\Personal" /f /v Notified /t REG_DWORD /d "1"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v Path /d "%~dp0\"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v Company /d "��ɿ˼�����̳"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v UserName /d "roustar31"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v Version /d "6.0.0098"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v MagicCode /t reg_binary /d "91eec2eac5b011748b19a847dc3b68f2e207090012"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v MagicTime /t reg_binary /d "e20709000200120010000f002d00c701"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v ProductKey /d "180808-116406-999166"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\License\6\6" /f /v ProductKey /d "180808-116406-999166"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\License\6" /f /v ProductKey /d "180808-116406-999166"

reg add "HKCU\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6\Personal" /f /v Notified /t REG_DWORD /d "1"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v Type /d "Register"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v RESELLER /d ""
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v Company /d "��ɿ˼�����̳"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v UserName /d "roustar31"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v Version /d "6.0.0092"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v MagicCode /t reg_binary /d "91eec2eac5b011748b19a847dc3b68f2e20709001200"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v MagicTime /t reg_binary /d "e20709000200120010000f002d00c701"
reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xmanager\6" /f /v ProductKey /d "180918-116783-999110"


mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\Xshell.lnk""):b.TargetPath=""%~dp0Xshell.exe"":b.WorkingDirectory=""%~dp0"":b.Save:close")

start /wait "" "%~DP0hostsedit.exe" /a transact.netsarang.com
start /wait "" "%~DP0hostsedit.exe" /a update.netsarang.com
start /wait "" "%~DP0hostsedit.exe" /a www.netsarang.com
start /wait "" "%~DP0hostsedit.exe" /a www.netsarang.co.kr
start /wait "" "%~DP0hostsedit.exe" /a sales.netsarang.com
exit
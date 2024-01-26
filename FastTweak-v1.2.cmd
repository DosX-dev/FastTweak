:: https://github.com/DosX-dev/FastTweak

@set no-output-attribute=^>nul 2^>^&1

@echo off
title FastTweak (version 1.2) ^| ARCH: %PROCESSOR_ARCHITECTURE%
mode con:cols=100 lines=20
color 1f

reg query "HKU\S-1-5-19" %no-output-attribute%
if %errorlevel% equ 1 goto UACPrompt

call :colored 0 0 "                                                                                                    "

call :colored 0 0 "  "
call :colored 8 f "                                                                                                "
call :colored 0 0 "  "

::                                                                                                                 ;
call :colored 0 0 "  "
call :colored 0 f "                                    FAST-TWEAK UTILITY                                          "
call :colored 0 0 "  "

call :colored 0 0 "  "
call :colored 8 f "                          https://github.com/DosX-dev/FastTweak                                 "
call :colored 0 0 "  "

call :colored 0 0 "  "
call :colored 8 f "                                                                                                "
call :colored 0 0 "  "

call :colored 0 0 "                                                                                                    "

echo.
timeout 1 /nobreak %no-output-attribute%
call :colored 0 1 " "
call :colored 0 9 "  CURRENT WORKSTATION  "
call :colored 0 1 " "
call :colored e 1 "%computername%"

call :sizeof computername
set /a size_of_computername=%errorlevel%
set /a to_draw=23-size_of_computername

for /l %%t in (1, 1, %to_draw%) do (
    call :colored 0 1 "  "
)

call :colored 0 1 " "
call :colored 0 9 "  STARTED BY USER  "
call :colored 0 1 " "
call :colored e 1 "%username%"

echo.
echo.


call :log "Configuring services..."
(
sc config WSearch start= auto
sc config AppIDSvc start= auto
sc config UserManager start= auto
sc config StateRepositorySvc start= auto
sc config TileDataModelSvc start= auto
sc config WpnService start= auto
sc config BrokerInfrastructure start= auto
) %no-output-attribute%

call :log "Enabling PowerShell..."
(
powershell Set-ExecutionPolicy RemoteSigned
reg add "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v ExecutionPolicy /t REG_SZ /d RemoteSigned /f
) %no-output-attribute%

call :log "Cleaning Windows Defender related registry keys..."
(
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpPlatformKillbitsFromEngine" /t REG_BINARY /d 0000000000000000 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtectionSource" /t REG_DWORD /d 0 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpCapability" /t REG_BINARY /d 0000000000000000 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\{900c0763-5cad-4a34-bc1f-40cd513679d5}" /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\{900c0763-5cad-4a34-bc1f-40cd513679d5}" /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /f 
reg delete "HKEY_CLASSES_ROOT\Folder\shell\WindowsDefender" /f 
reg delete "HKEY_CLASSES_ROOT\DesktopBackground\Shell\WindowsSecurity" /f 
reg delete "HKEY_CLASSES_ROOT\Folder\shell\WindowsDefender\Command" /f 
reg delete "HKEY_CLASSES_ROOT\AppX1sy7rwrc20ggq97a6x1mgmjat0rthy51" /f 
reg delete "HKEY_CLASSES_ROOT\AppXb5yxv86nkhp530y0y50yxe69c1qwad1x" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.sechealthui_8wekyb3d8bbwe" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Extensions\ProgIDs\AppX1sy7rwrc20ggq97a6x1mgmjat0rthy51" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Extensions\ProgIDs\AppXb5yxv86nkhp530y0y50yxe69c1qwad1x" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Extensions\windows.fileTypeAssociation\.all\AppXb5yxv86nkhp530y0y50yxe69c1qwad1x" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.SecHealthUI_8wekyb3d8bbwe" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.SecHealthUI_8wekyb3d8bbwe" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.SecHealthUI_8wekyb3d8bbwe" /f 
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.SecHealthUI_8wekyb3d8bbwe" /f 
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{2781761E-28E0-4109-99FE-B9D127C57AFE}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{2781761E-28E2-4109-99FE-B9D127C57AFE}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{195B4D07-3DE2-4744-BBF2-D90121AE785B}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{361290c0-cb1b-49ae-9f3e-ba1cbe5dab35}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{45F2C32F-ED16-4C94-8493-D72EF93A051B}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{6CED0DAA-4CDE-49C9-BA3A-AE163DC3D7AF}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{8a696d12-576b-422e-9712-01b9dd84b446}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{8C9C0DB7-2CBA-40F1-AFE0-C55740DD91A0}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{A2D75874-6750-4931-94C1-C99D3BC9D0C7}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{A7C452EF-8E9F-42EB-9F2B-245613CA0DC9}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{DACA056E-216A-4FD1-84A6-C306A017ECEC}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{E3C9166D-1D39-4D4E-A45D-BC7BE9B00578}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\WOW6432Node\CLSID\{F6976CF5-68A8-436C-975A-40BE53616D59}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{2781761E-28E0-4109-99FE-B9D127C57AFE}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{2781761E-28E2-4109-99FE-B9D127C57AFE}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{195B4D07-3DE2-4744-BBF2-D90121AE785B}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{361290c0-cb1b-49ae-9f3e-ba1cbe5dab35}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{45F2C32F-ED16-4C94-8493-D72EF93A051B}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{6CED0DAA-4CDE-49C9-BA3A-AE163DC3D7AF}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{8a696d12-576b-422e-9712-01b9dd84b446}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{8C9C0DB7-2CBA-40F1-AFE0-C55740DD91A0}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{A2D75874-6750-4931-94C1-C99D3BC9D0C7}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{A7C452EF-8E9F-42EB-9F2B-245613CA0DC9}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{DACA056E-216A-4FD1-84A6-C306A017ECEC}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{E3C9166D-1D39-4D4E-A45D-BC7BE9B00578}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{F6976CF5-68A8-436C-975A-40BE53616D59}" /f
) %no-output-attribute%

:: Autorun 
call :log "Cleaning Autorun..."
(
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /va /f
powershell "Remove-Item -Path ([System.Environment]::GetFolderPath('Startup') + '\*') -Force"
) %no-output-attribute%

:: Delete Shell registry key for current user and local machine
call :log "Deleting Winlogon\Shell values..."
(
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v Shell /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v Shell /f
) %no-output-attribute%

call :log "Starting Windows Installer services..."
(
sc config trustedinstaller start=auto
sc config bits start=auto
sc config cryptsvc start=auto
sc config wuauserv start=auto
net start trustedinstaller
net start bits
net start cryptsvc
net start wuauserv
) %no-output-attribute%

:: Perform system integrity and cleanup checks
call :log "Running system files checker..."
sfc /scannow %no-output-attribute%

call :log "Running DISM scan for image health..."
dism /online /cleanup-image /scanhealth %no-output-attribute%

call :log "Checking DISM image health..."
dism /online /cleanup-image /checkhealth %no-output-attribute%

call :log "Restoring DISM image health..."
dism /online /cleanup-image /restorehealth %no-output-attribute%

call :log "Resetting base image..."
dism /online /cleanup-image /startcomponentcleanup /resetbase %no-output-attribute%

:: Disable telemetry and more...

call :log "Telemetry disabling..."
(
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableDeviceCensus" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "DiagnosticErrorText" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticErrorText" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticLinkText" /t REG_SZ /d "" /f
) %no-output-attribute%

:: Uninstall 'Cortana'
call :log "Uninstalling Cortana..."
powershell Get-AppXPackage -AllUsers Microsoft.549981C3F5F10 ^| Remove-AppxPackage %no-output-attribute%

:: Cleanup temp files...
if not exist "%temp%" md "%temp%"
pushd "%temp%"
rd "%cd%" /q /s %no-output-attribute%
popd

call :log "Clearing event logs..."
for /f "delims=" %%I in ('WEVTUTIL EL') do (WEVTUTIL CL "%%I") %no-output-attribute%

call :log "Cleaning icons cache..."
(
del %localappdata%\IconCache.db /A
ie4uinit.exe -show
ie4uinit.exe -ClearIconCache
) %no-output-attribute%

call :log "Disk cleaning..."
(
del %appdata%\*.log /q /s
start /min /wait cleanmgr /sagerun:1 /tuneup:1 /autoclean
) %no-output-attribute%

call :log "Explorer restarting..."
(
taskkill.exe /im explorer.exe /f
start explorer.exe
) %no-output-attribute%

call :log "Completion..."

echo.

timeout 1 /nobreak %no-output-attribute%

cls
color 0f

call :colored 0 f "                                                                                                    "

call :colored 0 f "  "
call :colored 8 2 "                                                                                                "
call :colored 0 f "  "

call :colored 0 f "  "
call :colored f 2 "         The utility has completed its work. The system has been repaired and cleaned.          "
call :colored 0 f "  "

call :colored 0 f "  "
call :colored 7 2 "                                  You can close this window.                                    "
call :colored 0 f "  "

call :colored 0 f "  "
call :colored 8 2 "                                                                                                "
call :colored 0 f "  "

call :colored 0 f "                                                                                                    \n\n"
call :colored 0 0 " "
call :colored f 4 "[1] - Exit from FastTweak"
choice /C "1" /N
exit /b 0

:UACPrompt
color 46
for /l %%i in (1, 1, 20) do @ (
    echo:Administrator rights required!
)
mshta "vbscript:CreateObject("Shell.Application").ShellExecute("%~fs0", "", "", "runas", 1) & Close()"
goto :eof

:log
call :colored 3 1 "[%time%] "
call :colored f 1 "%~1\n"
goto :eof

:: Colored-Batch (assembly module)
:colored
if "%~3" == "" (
   echo Incorrect arguments
)
set "modulePath=%temp%\colored_batch_module.com"
set "tempSourcePath=%temp%\%random%.tmp"
if not exist "%modulePath%" (
    set/p<nul="using System;namespace ColoredBatch{internal class Program{static void Main(string[] args){try{Console.ForegroundColor=(ConsoleColor)Convert.ToInt32(args[0],16);Console.BackgroundColor=(ConsoleColor)Convert.ToInt32(args[1],16);Console.Write(args[2].Replace("\\n","\n"));Console.ResetColor();Environment.Exit(0);}catch(Exception ex){Console.ResetColor();Console.WriteLine(ex.Message);Environment.Exit(1);}}}}">%tempSourcePath%
    "%windir%\Microsoft.NET\Framework\v4.0.30319\csc.exe" /out:"%modulePath%" "%tempSourcePath%" /nologo /debug- /optimize+
    if exist "%tempSourcePath%" del "%tempSourcePath%"
)
call %modulePath% %*
goto :eof

:: sizeof (native-batch module)
:sizeof
call set "sizeof.in=%%%~1%%"
if ["%sizeof.in%"] == [""] EXIT/B 0
set /a sizeof.len=1
    :sizeof.tmp
        set "sizeof.in=%sizeof.in:~0,-1%"
        if ["%sizeof.in%"] == [""] (EXIT/B %sizeof.len%) else (
            set /a sizeof.len=sizeof.len + 1
            goto sizeof.tmp
        )

Echo off

taskkill /f /im OneDrive.exe

rem 32 bits
%SystemRoot%\System32\OneDriveSetup.exe /uninstall

rem 64 bits
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

pause

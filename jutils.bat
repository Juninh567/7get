@echo off
goto %1
:alert
echo x=msgbox(%2 ,0, %3) > cached.vbs
cached.vbs
del cached.vbs
cmd /k
exit
:adrun
@echo Set objShell = CreateObject("Shell.Application") > %temp%\sudo.tmp.vbs
@echo args = Right("%*", (Len("%*") - Len("%2"))) >> %temp%\sudo.tmp.vbs
@echo objShell.ShellExecute "%2", args, "", "runas" >> %temp%\sudo.tmp.vbs
@cscript %temp%\sudo.tmp.vbs
cmd /k
exit
:get
wget %2
cmd /k
exit
:regedit
:: You must know how to use reg.exe
reg %2 %3
cmd /k
exit

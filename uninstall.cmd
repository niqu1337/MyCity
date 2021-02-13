@echo off
mode 54,15
color E
cd C:\Users\%username%\AppData\Roaming

title MyCity -- Uninstall
echo Type Y to uninstall MyCity files
del $mycity >>nul
exit
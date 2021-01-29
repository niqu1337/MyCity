@echo off
mode 54,15
color E
cd C:\Users\%username%\AppData\Roaming

title MyCity -- Uninstall
echo You really want to uninstall mycity files? (Y/N)
del $mycity >>nul
exit
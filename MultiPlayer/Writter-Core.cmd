@echo off
mode 54,5
title MyCity -- Writter Core
color E

:loop
cls
cd C:\Users\%username%\AppData\Roaming\$mycity\$mp
set /p "WrittedMessage=>> "
echo %username% -- %WrittedMessage% > .core
goto loop
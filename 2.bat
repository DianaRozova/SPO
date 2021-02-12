@echo off
for %%a in (c,d) do (
 dir /a-d/b/s "%%a:\sdgdsd.txt"|set /p sPath=^& call "%%sPath%%"
)
pause
@echo off
for %%a in (c,d) do (
 for /f "tokens=*" %%i in ('where /R %%a:\ sdgdsd.txt') do start %%i
)
pause
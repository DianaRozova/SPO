@echo off&chcp 1251&cls
for /f "delims=: tokens=2" %%# in ('ipconfig^|find "IPv4"') do echo IP:%%#>"3.txt"
for /f "delims=: tokens=2" %%# in ('ipconfig^|find "��᪠ �����"') do echo Mask:%%#>>"3.txt"
for /f "delims=: tokens=2" %%# in ('ipconfig^|find "��"') do echo Gateway:%%#>>"3.txt"
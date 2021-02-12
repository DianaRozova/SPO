@echo off
choice /m "Отформатировать С:"
choice /m "Вы уверены что хотите отформатировать С: "
if %errorlevel% == 1 ( 
echo Диск С: отформатирован.
) else ( 
echo До встречи.
)
pause
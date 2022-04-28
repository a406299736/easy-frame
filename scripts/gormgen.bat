@echo off
chcp 65001
echo.
echo Regenerating file
echo.
go run -v .\cmd\mysqlmd\main.go -name %1 -tables %2
if %errorlevel% == 1 (
echo.
echo failed!!!
exit 1
)
echo.
echo create curd code :
echo.
go build -o gormgen .\cmd\gormgen\main.go
if %errorlevel% == 1 (
echo.
echo failed!!!
exit 1
)

if exist %GOPATH%\bin (
move gormgen %GOPATH%\bin\gormgen.exe
) else (
md %GOPATH%\bin
move gormgen %GOPATH%\bin\gormgen.exe
)
if %errorlevel% == 1 (
echo.
echo failed!!!
exit 1
)

go generate .\...
if %errorlevel% == 1 (
echo.
echo failed!!!
exit 1
)
echo.
echo Formatting code
echo.
go run -v .\cmd\mfmt\main.go
if %errorlevel% == 1 (
echo.
echo failed!!!
exit 1
)
echo.
echo Done.

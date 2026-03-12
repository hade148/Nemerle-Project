@echo off
REM -------------------------------------------------------
REM  build.bat  –  Compile the Nemerle project
REM
REM  Prerequisites:
REM    Nemerle must be installed and ncc.exe must be on PATH
REM    or located at C:\Program Files\Nemerle\ncc.exe
REM -------------------------------------------------------

SET NCC="C:\Program Files\Nemerle\ncc.exe"

IF NOT EXIST %NCC% (
    SET NCC="C:\Program Files (x86)\Nemerle\ncc.exe"
)

IF NOT EXIST %NCC% (
    echo Could not find ncc.exe.  Make sure Nemerle is installed
    echo and add it to your PATH, then run:
    echo   ncc.exe Main.n -o VMTranslator.exe
    pause
    exit /b 1
)

echo Compiling Main.n ...
%NCC% Main.n -o VMTranslator.exe

IF %ERRORLEVEL% EQU 0 (
    echo.
    echo Build successful!  Run VMTranslator.exe to start the program.
) ELSE (
    echo.
    echo Build FAILED – check the output above for errors.
)
pause

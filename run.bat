@echo off
cls

echo Checking for target directory...
if not exist ".\elearning\target\" (
    echo Target directory not found. Building the project...
    pushd elearning
    call mvn clean install
    popd
    echo Build completed.
) else (
    echo Target directory exists. Skipping build.
)

echo Starting Tomcat...
call startup.bat
if %ERRORLEVEL% neq 0 (
    echo Tomcat failed to start. Check your Tomcat10 command.
    pause
    exit /b %ERRORLEVEL%
)
echo Tomcat started.

start http://localhost:8080/elearning/
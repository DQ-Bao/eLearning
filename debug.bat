@echo off
cls

if "%CATALINA_HOME%"=="" (
    echo CATALINA_HOME is not properly set
    pause
    exit
)

if "%JAVA_HOME%"=="" (
    echo JAVA_HOME is not properly set
    pause
    exit
)

if "%JRE_HOME%"=="" (
    echo JRE_HOME is not properly set
    pause
    exit
)

echo Checking for target war...

set TARGET=.\elearning\target\elearning.war

if not exist %TARGET% (
    echo Target war not found. Building the project...
    pushd elearning
    call mvn clean install
    popd
    echo Build completed.
) else (
    echo Target war exists. Skipping build.
)

echo Starting Tomcat...

set TOMCAT_PORT=8080

copy /y %TARGET% "%CATALINA_HOME%\webapps"

netstat -nao | findstr :%TOMCAT_PORT%
if %ERRORLEVEL% equ 1 (
    call "%CATALINA_HOME%/bin/shutdown.bat"
)
set JPDA_ADDRESS=8000
set JPDA_TRANSPORT=dt_socket
call "%CATALINA_HOME%/bin/catalina.bat" jpda start

if %ERRORLEVEL% neq 0 (
    echo Tomcat failed to start.
    pause
    exit /b %ERRORLEVEL%
)
echo Tomcat started.

start http://localhost:%TOMCAT_PORT%/elearning/
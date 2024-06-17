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

echo Building the project...
pushd elearning
call mvn clean install
popd
echo Build completed.

echo Deploying the project...
set TARGET=.\elearning\target\elearning.war
copy /y %TARGET% "%CATALINA_HOME%\webapps"
echo Deploy completed.

pause
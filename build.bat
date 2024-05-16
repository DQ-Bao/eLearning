@echo off
cls
echo Building the project...
pushd elearning
call mvn clean install
popd
echo Build completed.
pause
@echo off
cls
echo Cleaning the project...
pushd elearning
call mvn clean
popd
echo Clean completed.
pause
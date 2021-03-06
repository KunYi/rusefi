echo I am hw_test.bat
pwd

cd firmware
rem Using magic 'cd' system variable here
set "cur_folder=%cd%"
call flash_erase407.bat
cd %cur_folder%
pwd
echo "hw_test.bat: trying to flash"
rem This script depends on someone else building firmware
call flash_openocd407.bat

cd %cur_folder%

if not exist build/rusefi.bin echo FIRMWARE NOT FOUND
if not exist build/rusefi.bin exit -1

pwd

cd ..

rem echo Running some commands
rem pwd
rem java -cp java_console_binary\rusefi_console.jar com.rusefi.CmdLine "set_led_blinking_period 10"

cd java_console

echo Running tests
which java
which javac
ant realtest

IF NOT ERRORLEVEL echo ERROR DETECTED
IF NOT ERRORLEVEL 0 EXIT /B 1

echo %date% %time%
echo hw_test.bat: done

@echo off
if "%~1"=="" goto ERROR_PARAM
rem echo Current directory: %cd%
rem echo Batch file's directory: %~dp0
copy /y %~dp0\wgnuplot.ini %UserProfile%\AppData\Roaming\ > NUL

for /f "tokens=3 delims= " %%i in (%1) do (
	SET IP=%%i
	break
)
rem echo IP=%IP%

echo Plotting data, wait a moment ...
start /b /wait /max "" /realtime "gnuplot.exe" --persist -c "%~dp0\WMS_log_plot.plt" "%1" "%IP%"

echo Plot exit.
rem pause
exit

:ERROR_PARAM
echo =====================================================
echo You need to drag and drop the log file on this batch.
echo =====================================================
timeout 30 > NUL
exit /b -1

:ERROR_LOG_FILE
echo ====================================================
echo You need to check drop file is correct GDM log file.
echo ====================================================
timeout 30 > NUL
exit /b -1

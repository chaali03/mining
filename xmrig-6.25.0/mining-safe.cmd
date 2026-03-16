@echo off
:: XMRig Mining dengan auto-stop kalau CPU kepanasan
:: Monitoring suhu CPU setiap 30 detik

cd /d "%~dp0"

set WALLET=49JXNsqLG7t96ENRgBbJNyW6r69TDXuFCTFLM44o5LQpN8jNP95fVGhfF8HdKMPaqsAb3WGM9mEUBWBuK9wAm4xKKwaXyEH
set POOL=gulf.moneroocean.stream:10128
set WORKER=worker1
set MAX_TEMP=85

echo ========================================
echo XMRig Safe Mining (Auto-Stop)
echo ========================================
echo Pool: %POOL%
echo Wallet: %WALLET%
echo Max Temperature: %MAX_TEMP%C
echo ========================================
echo.
echo Mining akan otomatis stop kalau CPU ^> %MAX_TEMP%C
echo Monitoring suhu setiap 30 detik
echo.
echo Tekan Ctrl+C untuk stop manual
echo.

:: Start mining in background
start "XMRig Mining" /MIN xmrig.exe -o %POOL% -u %WALLET% -p %WORKER% --cpu-max-threads-hint=100 --health-print-time=30 --print-time=30 --coin monero

:: Monitor temperature
:monitor
timeout /t 30 /nobreak >nul

:: Get CPU temperature using PowerShell
for /f "tokens=*" %%i in ('powershell -Command "Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace root/wmi | Select-Object -ExpandProperty CurrentTemperature | ForEach-Object { ($_ / 10) - 273.15 }"') do set TEMP=%%i

if defined TEMP (
    echo [%time%] CPU Temperature: %TEMP%C
    
    :: Check if temperature exceeds limit (simple comparison)
    if %TEMP% GTR %MAX_TEMP% (
        echo.
        echo [WARNING] CPU TERLALU PANAS! (%TEMP%C ^> %MAX_TEMP%C)
        echo Stopping mining untuk keamanan...
        taskkill /F /IM xmrig.exe >nul 2>&1
        echo.
        echo Mining dihentikan. Tunggu CPU dingin dulu.
        pause
        exit /b
    )
) else (
    echo [%time%] Monitoring suhu CPU... (Mining tetap jalan)
)

goto monitor

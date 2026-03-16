@echo off
:: Install WinRing0 driver untuk MSR optimization
:: HARUS dijalankan sebagai Administrator

echo ========================================
echo Install WinRing0 Driver untuk XMRig
echo ========================================
echo.

cd /d "%~dp0"

:: Check if running as admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Script ini harus dijalankan sebagai Administrator!
    echo Klik kanan file ini, pilih "Run as Administrator"
    echo.
    pause
    exit /b 1
)

echo Installing WinRing0 driver...
echo.

:: Stop existing service if any
sc stop WinRing0_1_2_0 >nul 2>&1
timeout /t 2 /nobreak >nul
sc delete WinRing0_1_2_0 >nul 2>&1
timeout /t 2 /nobreak >nul

:: Create and start service
sc create WinRing0_1_2_0 binPath= "%cd%\WinRing0x64.sys" type= kernel start= demand

if %errorlevel% neq 0 (
    echo Service already exists, trying to start it...
)

sc start WinRing0_1_2_0

if %errorlevel% equ 0 (
    echo.
    echo [OK] WinRing0 driver berhasil di-install!
    echo Sekarang jalankan mining-admin.cmd untuk mining dengan performa maksimal
) else (
    echo.
    echo [WARNING] Driver install mungkin gagal
    echo Tapi mining tetap bisa jalan, cuma hashrate gak maksimal
)

echo.
pause

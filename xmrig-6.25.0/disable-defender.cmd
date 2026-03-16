@echo off
:: Script untuk disable Windows Defender Real-time Protection
:: HARUS dijalankan sebagai Administrator (klik kanan > Run as Administrator)

echo ========================================
echo Disable Windows Defender untuk XMRig
echo ========================================
echo.

:: Matikan Real-time Protection
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

if %errorlevel% equ 0 (
    echo [OK] Windows Defender Real-time Protection berhasil dimatikan
) else (
    echo [ERROR] Gagal matikan Defender. Pastikan run as Administrator!
)

echo.
echo Sekarang coba jalankan mining.cmd lagi
echo.
pause

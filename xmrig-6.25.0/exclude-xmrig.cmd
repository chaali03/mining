@echo off
:: Script untuk exclude folder XMRig dari Windows Defender
:: HARUS dijalankan sebagai Administrator (klik kanan > Run as Administrator)

echo ========================================
echo Exclude XMRig dari Windows Defender
echo ========================================
echo.

cd /d "%~dp0"

:: Exclude folder ini dari scanning
powershell -Command "Add-MpPreference -ExclusionPath '%cd%'"

if %errorlevel% equ 0 (
    echo [OK] Folder XMRig berhasil di-exclude dari Defender
    echo Folder: %cd%
) else (
    echo [ERROR] Gagal exclude folder. Pastikan run as Administrator!
)

echo.
echo Sekarang coba jalankan mining.cmd lagi
echo.
pause

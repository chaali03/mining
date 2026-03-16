@echo off
:: Start WinRing0 driver service
:: Run as Administrator

echo Starting WinRing0 driver...
echo.

sc start WinRing0_1_2_0

if %errorlevel% equ 0 (
    echo.
    echo [OK] Driver berhasil dijalankan!
    echo Sekarang jalankan mining-admin.cmd
) else (
    echo.
    echo [INFO] Driver mungkin sudah jalan atau ada masalah
    echo Coba jalankan mining-admin.cmd aja, harusnya sudah bisa
)

echo.
pause

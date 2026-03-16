@echo off
:: Ganti DNS ke Cloudflare (1.1.1.1)
:: Run as Administrator

echo Mengganti DNS ke Cloudflare...
echo.

:: Cari nama network adapter
for /f "tokens=3*" %%i in ('netsh interface show interface ^| findstr "Connected"') do set adapter=%%j

echo Network Adapter: %adapter%
echo.

:: Set DNS ke Cloudflare
netsh interface ip set dns "%adapter%" static 1.1.1.1
netsh interface ip add dns "%adapter%" 1.0.0.1 index=2

echo.
echo DNS berhasil diganti ke Cloudflare (1.1.1.1)
echo Coba jalankan mining.cmd lagi
echo.
pause

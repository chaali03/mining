@echo off
:: XMRig Mining via Tor Network
:: Download Tor Browser dulu: https://www.torproject.org/download/
:: Jalankan Tor Browser, biarkan connect, baru jalankan script ini

cd /d "%~dp0"

set WALLET=49JXNsqLG7t96ENRgBbJNyW6r69TDXuFCTFLM44o5LQpN8jNP95fVGhfF8HdKMPaqsAb3WGM9mEUBWBuK9wAm4xKKwaXyEH
set POOL=xmrpool.eu:3333
set WORKER=worker1

echo ========================================
echo XMRig Mining via Tor
echo ========================================
echo.
echo PENTING: Pastikan Tor Browser sudah jalan!
echo.
echo Pool: %POOL%
echo Wallet: %WALLET%
echo Proxy: SOCKS5 via Tor (127.0.0.1:9150)
echo ========================================
echo.

:: Mining via Tor SOCKS5 proxy
xmrig.exe -o %POOL% -u %WALLET% -p %WORKER% --cpu-max-threads-hint=100 --health-print-time=10 --print-time=10 --socks5 127.0.0.1:9150

pause

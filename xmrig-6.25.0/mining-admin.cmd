@echo off
:: XMRig Mining dengan Administrator privileges untuk hashrate maksimal
:: HARUS dijalankan sebagai Administrator (klik kanan > Run as Administrator)

cd /d "%~dp0"

set WALLET=49JXNsqLG7t96ENRgBbJNyW6r69TDXuFCTFLM44o5LQpN8jNP95fVGhfF8HdKMPaqsAb3WGM9mEUBWBuK9wAm4xKKwaXyEH
set POOL=gulf.moneroocean.stream:10128
set WORKER=worker1

echo ========================================
echo XMRig CPU Mining (Administrator Mode)
echo Pool: %POOL%
echo Wallet: %WALLET%
echo ========================================
echo.
echo Mining dengan MSR optimization untuk hashrate maksimal
echo.

xmrig.exe -o %POOL% -u %WALLET% -p %WORKER% --cpu-max-threads-hint=100 --health-print-time=10 --print-time=10 --coin monero

pause

@echo off
:: XMRig Mining Script - Monero (XMR)
:: Pool: supportxmr.com (reliable, low fee 0.6%)
::
:: CARA PAKAI:
:: 1. Ganti YOUR_WALLET_ADDRESS dengan wallet XMR kamu
:: 2. Double click file ini untuk mulai mining
:: 3. Untuk stop mining, tutup window atau tekan Ctrl+C

cd /d "%~dp0"

:: Ganti wallet address di bawah ini dengan punya kamu
set WALLET=49JXNsqLG7t96ENRgBbJNyW6r69TDXuFCTFLM44o5LQpN8jNP95fVGhfF8HdKMPaqsAb3WGM9mEUBWBuK9wAm4xKKwaXyEH

:: Pool settings - using MoneroOcean (auto-switching, better dashboard)
set POOL=gulf.moneroocean.stream:10128

:: Worker name (optional, bisa diganti dengan nama PC kamu)
set WORKER=worker1

echo ========================================
echo XMRig CPU Mining
echo Pool: %POOL%
echo Wallet: %WALLET%
echo Worker: %WORKER%
echo ========================================
echo.
echo Mining akan dimulai...
echo Tekan Ctrl+C untuk stop mining
echo.

xmrig.exe -o %POOL% -u %WALLET% -p %WORKER% --cpu-max-threads-hint=100 --health-print-time=10 --print-time=10 --coin monero

pause

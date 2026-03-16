@echo off
:: XMRig Mining Bitcoin - MAXIMUM PERFORMANCE
:: Optimize semua setting untuk hasil maksimal

cd /d "%~dp0"

set WALLET_BTC=3B7VePx71mP8SnvmnGNSapkhratFY1iGct1
set REFERRAL=5m3v-wmcl
set POOL=rx.unmineable.com:3333
set WORKER=worker1

echo ========================================
echo XMRig Bitcoin Mining - MAX PERFORMANCE
echo ========================================
echo.
echo Optimizing system...
echo.

:: Set process priority to High
echo Setting high priority...

:: Disable Windows power throttling
powershell -Command "powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" >nul 2>&1

:: Start mining with maximum threads and optimizations
echo Starting mining with maximum performance...
echo.
echo Pool: %POOL%
echo Coin: Bitcoin (BTC)
echo Wallet: %WALLET_BTC%
echo Dashboard: https://unmineable.com/coins/BTC/address/%WALLET_BTC%
echo.

:: Use ALL CPU threads (100%), high priority, all optimizations
start /HIGH /B xmrig.exe -o %POOL% -u BTC:%WALLET_BTC%.%WORKER%#%REFERRAL% -p x --cpu-max-threads-hint=100 --cpu-priority=5 --health-print-time=10 --print-time=10 --coin monero --randomx-mode=fast --randomx-no-rdmsr

echo.
echo Mining started with maximum performance!
echo Check dashboard untuk lihat hashrate
echo.
pause

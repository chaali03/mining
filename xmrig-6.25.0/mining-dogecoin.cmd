@echo off
:: XMRig Mining via Unmineable - Dibayar dalam DOGECOIN
:: Mining RandomX tapi hasil dibayar DOGE

cd /d "%~dp0"

:: GANTI WALLET_DOGE dengan Dogecoin wallet address kamu
set WALLET_DOGE=YOUR_DOGECOIN_WALLET_ADDRESS

:: Referral code (optional)
set REFERRAL=5m3v-wmcl

:: Pool Unmineable untuk RandomX
set POOL=rx.unmineable.com:3333

:: Worker name
set WORKER=worker1

echo ========================================
echo XMRig Mining - Unmineable (Dogecoin)
echo ========================================
echo Pool: %POOL%
echo Coin: Dogecoin (DOGE)
echo Wallet: %WALLET_DOGE%
echo Worker: %WORKER%
echo ========================================
echo.
echo Mining RandomX, dibayar dalam Dogecoin
echo Dashboard: https://unmineable.com/coins/DOGE/address/%WALLET_DOGE%
echo.

:: Format: DOGE:wallet_address.worker#referral
xmrig.exe -o %POOL% -u DOGE:%WALLET_DOGE%.%WORKER%#%REFERRAL% -p x --cpu-max-threads-hint=100 --health-print-time=10 --print-time=10 --coin monero

pause

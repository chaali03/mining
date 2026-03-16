@echo off
:: XMRig Mining via Unmineable - Dibayar dalam BITCOIN
:: Mining RandomX tapi hasil dibayar BTC

cd /d "%~dp0"

:: GANTI WALLET_BTC dengan Bitcoin wallet address kamu
set WALLET_BTC=3B7VePx71mP8SnvmnGNSapkhratFY1iGct1

:: Referral code (optional, bisa dihapus kalau gak mau)
set REFERRAL=5m3v-wmcl

:: Pool Unmineable untuk RandomX
set POOL=rx.unmineable.com:3333

:: Worker name
set WORKER=worker1

echo ========================================
echo XMRig Mining - Unmineable (Bitcoin)
echo ========================================
echo Pool: %POOL%
echo Coin: Bitcoin (BTC)
echo Wallet: %WALLET_BTC%
echo Worker: %WORKER%
echo ========================================
echo.
echo Mining RandomX, dibayar dalam Bitcoin
echo Dashboard: https://unmineable.com/coins/BTC/address/%WALLET_BTC%
echo.

:: Format: BTC:wallet_address.worker#referral
xmrig.exe -o %POOL% -u BTC:%WALLET_BTC%.%WORKER%#%REFERRAL% -p x --cpu-max-threads-hint=100 --health-print-time=10 --print-time=10 --coin monero

pause

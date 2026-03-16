#!/data/data/com.termux/files/usr/bin/bash
# Script untuk langsung mining di Android
# Wallet: 3B7VePx71mP8SnvmnGNSapkhratFY1iGct

cd ~/xmrig/build

echo "=== Memulai Mining ==="
echo "Wallet: 3B7VePx71mP8SnvmnGNSapkhratFY1iGct"
echo "Pool: Unmineable (Auto convert ke Bitcoin)"
echo ""
echo "Cek hasil mining di:"
echo "https://unmineable.com/coins/BTC/address/3B7VePx71mP8SnvmnGNSapkhratFY1iGct"
echo ""
echo "Tekan Ctrl+C untuk stop mining"
echo ""

./xmrig -o rx.unmineable.com:3333 \
        -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1 \
        -p x \
        --threads=2

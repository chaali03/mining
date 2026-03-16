#!/data/data/com.termux/files/usr/bin/bash
# XMRig Setup untuk Android (Termux)
# Jalankan script ini di Termux

echo "=== XMRig Android Setup ==="
echo "Menginstall dependencies..."

# Update packages
pkg update -y
pkg upgrade -y

# Install dependencies
pkg install -y git wget cmake libuv openssl

# Clone XMRig
echo "Downloading XMRig..."
cd ~
git clone https://github.com/xmrig/xmrig.git
cd xmrig

# Build XMRig
echo "Building XMRig..."
mkdir build
cd build
cmake .. -DWITH_HWLOC=OFF
make -j$(nproc)

echo "=== Setup selesai ==="
echo "XMRig terinstall di: ~/xmrig/build/xmrig"
echo ""
echo "Untuk menjalankan, gunakan:"
echo "cd ~/xmrig/build"
echo "./xmrig -o POOL_ADDRESS -u WALLET_ADDRESS -p PASSWORD"

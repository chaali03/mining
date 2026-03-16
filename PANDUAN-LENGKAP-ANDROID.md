# Panduan Lengkap Mining di Android - Siap Pakai!

## Wallet Bitcoin Anda
```
3B7VePx71mP8SnvmnGNSapkhratFY1iGct
```

---

## STEP 1: Install Termux

1. Buka browser HP, kunjungi: https://f-droid.org/en/packages/com.termux/
2. Download dan install Termux dari F-Droid
3. **JANGAN pakai Termux dari Play Store** (sudah outdated)

---

## STEP 2: Setup Termux (Copy Paste Satu-Satu)

Buka Termux, lalu jalankan command ini **satu per satu**:

### Update package
```bash
pkg update -y && pkg upgrade -y
```
Tunggu sampai selesai (2-5 menit)

### Install tools yang dibutuhkan
```bash
pkg install -y git wget cmake libuv openssl
```
Tunggu sampai selesai (3-5 menit)

### Berikan akses storage (opsional)
```bash
termux-setup-storage
```
Klik "Allow" kalau muncul popup

---

## STEP 3: Download dan Build XMRig

### Cara Otomatis (Pakai Script - RECOMMENDED!)
```bash
cd ~
wget https://raw.githubusercontent.com/xmrig/xmrig/master/scripts/build.termux.sh
chmod +x build.termux.sh
./build.termux.sh
```
**PENTING:** Proses ini lama (10-30 menit), jangan tutup Termux!

### Atau Cara Manual (Kalau script error)
```bash
cd ~
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake .. -DWITH_HWLOC=OFF
make -j$(nproc)
```

---

## STEP 4: Buat Config File (SKIP KALAU MAU LANGSUNG MINING)

Kalau mau pakai config file, buat config:

```bash
cd ~/xmrig/build
nano config.json
```

Paste config ini (tekan lama di layar → Paste):

```json
{
    "autosave": true,
    "cpu": {
        "enabled": true,
        "huge-pages": false,
        "priority": null,
        "asm": true,
        "max-threads-hint": 75
    },
    "opencl": {
        "enabled": false
    },
    "cuda": {
        "enabled": false
    },
    "pools": [
        {
            "algo": "rx/0",
            "coin": "monero",
            "url": "rx.unmineable.com:3333",
            "user": "BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1",
            "pass": "x",
            "rig-id": "android1",
            "keepalive": true,
            "tls": false
        }
    ],
    "print-time": 60,
    "retries": 5,
    "retry-pause": 5
}
```

**Simpan file:**
- Tekan `Ctrl + X` (di keyboard Termux)
- Tekan `Y`
- Tekan `Enter`

---

## STEP 5: Jalankan Mining! 🚀

### Cara Paling Gampang (Pakai Script)
```bash
cd ~
chmod +x start-mining-android.sh
./start-mining-android.sh
```

### Cara 2: Command Langsung
```bash
cd ~/xmrig/build
./xmrig -o rx.unmineable.com:3333 -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1 -p x --threads=2
```

### Cara 3: Pakai Config File
```bash
cd ~/xmrig/build
./xmrig
```

**Kalau berhasil, akan muncul:**
```
* READY threads=2 huge-pages=0%
* POOL connected to rx.unmineable.com:3333
* MINING started
```

---

## STEP 6: Cek Hasil Mining

Buka browser, kunjungi:
```
https://unmineable.com/coins/BTC/address/3B7VePx71mP8SnvmnGNSapkhratFY1iGct
```

Tunggu 5-10 menit, balance akan mulai muncul!

---

## Command Termux yang Sering Dipakai

### Lihat isi folder
```bash
ls
```

### Lihat isi folder detail
```bash
ls -la
```

### Pindah ke folder
```bash
cd nama_folder
```

### Kembali ke home
```bash
cd ~
```

### Lihat lokasi sekarang
```bash
pwd
```

### Stop mining
Tekan `Ctrl + C`

### Restart mining
```bash
cd ~/xmrig/build
./xmrig
```

### Cek apakah XMRig sudah terinstall
```bash
ls ~/xmrig/build/xmrig
```
Kalau muncul path file, berarti sudah terinstall

---

## Tips Penting

### 1. Cegah Termux Tertutup
- Swipe notifikasi Termux
- Tap "ACQUIRE WAKELOCK"
- Settings → Apps → Termux → Battery → Unrestricted

### 2. Kurangi Panas HP
Gunakan `--threads=2` atau `--threads=1`:
```bash
./xmrig -o rx.unmineable.com:3333 -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1 -p x --threads=1
```

### 3. Mining di Background
Install screen:
```bash
pkg install screen
screen -S mining
cd ~/xmrig/build
./xmrig
```
Tekan `Ctrl + A` lalu `D` untuk detach

Kembali ke mining:
```bash
screen -r mining
```

### 4. Auto-Start saat HP Restart
```bash
pkg install termux-boot
mkdir -p ~/.termux/boot
nano ~/.termux/boot/start-mining.sh
```

Paste ini:
```bash
#!/data/data/com.termux/files/usr/bin/bash
cd ~/xmrig/build
./xmrig -o rx.unmineable.com:3333 -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1 -p x --threads=2
```

Simpan, lalu:
```bash
chmod +x ~/.termux/boot/start-mining.sh
```

---

## Multi-Device Mining

Kalau punya banyak HP, pakai wallet yang sama tapi ganti rig-id:

**HP 1:**
```bash
./xmrig -o rx.unmineable.com:3333 -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1 -p x --threads=2
```

**HP 2:**
```bash
./xmrig -o rx.unmineable.com:3333 -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android2 -p x --threads=2
```

**HP 3:**
```bash
./xmrig -o rx.unmineable.com:3333 -u BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android3 -p x --threads=2
```

Semua hasil mining terkumpul ke 1 wallet!

---

## Troubleshooting

### Error: "ls: command not found"
```bash
pkg install coreutils
```

### Error: "MEMORY ALLOC FAILED"
```bash
./xmrig --no-huge-pages
```

### Error: "cmake: command not found"
```bash
pkg install cmake
```

### Termux crash/tertutup sendiri
- Disable battery optimization
- Aktifkan wakelock
- Kurangi threads jadi 1

### Mining lambat/HP panas
```bash
./xmrig --threads=1 --cpu-max-threads-hint=50
```

---

## Estimasi Penghasilan

**Dengan 1 HP (3 kH/s):**
- Per hari: 0.0000007 BTC = Rp 1,000
- Per bulan: 0.00002 BTC = Rp 30,000
- Capai min payout (0.0005 BTC): 1.7 tahun

**Dengan 5 HP:**
- Per hari: 0.0000035 BTC = Rp 5,000
- Capai min payout: 4 bulan

**Dengan 10 HP:**
- Per hari: 0.000007 BTC = Rp 10,000
- Capai min payout: 2 bulan

---

## Peringatan ⚠️

- Mining Android = RUGI (biaya > profit)
- HP bisa rusak karena overheat
- Baterai cepat rusak
- Hanya untuk belajar, bukan profit serius
- Minimum payout Unmineable: 0.0005 BTC

---

## Support

**Dashboard:** https://unmineable.com/coins/BTC/address/3B7VePx71mP8SnvmnGNSapkhratFY1iGct

**Referral code (dapat bonus 0.25% hashrate):**
Ganti `user` jadi:
```
BTC:3B7VePx71mP8SnvmnGNSapkhratFY1iGct.android1#abcd-1234
```
(Ganti `abcd-1234` dengan referral code orang yang ngajak)

---

## Selamat Mining! 🚀

Kalau ada error, screenshot dan tanya lagi!

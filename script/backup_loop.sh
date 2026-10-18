#!/bin/bash
# Nama   : M.Alfizahrin Ramadhan Daulay
# NIM    : 09011382530164
# Kelas  : Sistem Komputer
# Fungsi : Menjalankan backup.sh berulang kali tiap INTERVAL detik (jalan di background)

INTERVAL=60   # ganti sesuai kebutuhan (detik)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    "$SCRIPT_DIR/backup.sh"
    sleep "$INTERVAL"
done
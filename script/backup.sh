#!/bin/bash
# Nama   : M.Alfizahrin Ramadhan Daulay
# NIM    : 09011382530164
# Kelas  : Sistem Komputer

# ---------- 2. Variabel ----------
SRC_DIR="$HOME/data_09011382530164"
BACKUP_DIR="$HOME/backup_09011382530164"
LOG_FILE="$BACKUP_DIR/backup.log"

# ---------- 3. Direktori tujuan ----------
mkdir -p "$BACKUP_DIR"

# ---------- 4. Pencarian file ----------
FILELIST="/tmp/filelist_09011382530164.txt"
find "$SRC_DIR" -type f -name "*.txt" > "$FILELIST"

# ---------- 5. Pengarsipan dan kompresi ----------
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="backup_09011382530164_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

tar -czvf "$ARCHIVE_PATH" -T "$FILELIST"

# ---------- 6. Verifikasi arsip ----------
echo "Isi arsip $ARCHIVE_NAME:"
tar -tzvf "$ARCHIVE_PATH"

# ---------- 7. Log ----------
JUMLAH_FILE=$(wc -l < "$FILELIST")
UKURAN_ARSIP=$(du -h "$ARCHIVE_PATH" | cut -f1)
WAKTU=$(date +"%Y-%m-%d %H:%M:%S")

echo "$WAKTU | $ARCHIVE_NAME | $JUMLAH_FILE | $UKURAN_ARSIP" >> "$LOG_FILE"

rm -f "$FILELIST"

# ---------- 8. Fitur bonus: rotasi arsip (hapus backup > 7 hari) ----------
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +7 -delete
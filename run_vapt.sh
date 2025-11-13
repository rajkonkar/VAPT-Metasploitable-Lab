#!/bin/bash
# run_vapt.sh - Automated VAPT scan runner for Metasploitable (Kali)
# Usage: sudo bash run_vapt.sh <TARGET_IP>

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: sudo bash run_vapt.sh <TARGET_IP>"
  exit 1
fi

TARGET="$1"
OUTDIR="Project2-VAPT"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
mkdir -p "$OUTDIR/scans"
mkdir -p "$OUTDIR/screenshots"
mkdir -p "$OUTDIR/msflogs"

echo "[*] Starting VAPT run against $TARGET"
echo "[*] Outputs stored in $OUTDIR (scans/, screenshots/, msflogs/)"

# 1) Ping
ping -c 3 "$TARGET" | tee "$OUTDIR/scans/ping_$TIMESTAMP.txt"

# 2) Full Nmap aggressive scan
nmap -sC -sV -O -p- -T4 --reason -oA "$OUTDIR/scans/nmap_full_$TIMESTAMP" "$TARGET" | tee "$OUTDIR/scans/nmap_full_console_$TIMESTAMP.txt"

# 3) Focused Nmap vulnerability checks
nmap -p 21,22,23,25,80,139,445,3306,5432 -sV --script=vuln,default -oN "$OUTDIR/scans/nmap_vuln_$TIMESTAMP.txt" "$TARGET" | tee -a "$OUTDIR/scans/nmap_vuln_$TIMESTAMP.txt"

# 4) Nikto web scan (if web server present)
nikto -h "http://$TARGET" -output "$OUTDIR/scans/nikto_$TIMESTAMP.txt" || echo "[!] Nikto returned non-zero status"

# 5) Gobuster directory scan (if web server present)
gobuster dir -u "http://$TARGET/" -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o "$OUTDIR/scans/gobuster_root_$TIMESTAMP.txt" -t 40 || echo "[!] Gobuster returned non-zero status"

# 6) enum4linux SMB enumeration
enum4linux -a "$TARGET" > "$OUTDIR/scans/enum4linux_$TIMESTAMP.txt" || echo "[!] enum4linux returned non-zero status"

# 7) smbclient list shares
smbclient -L "//$TARGET" -N > "$OUTDIR/scans/smbclient_$TIMESTAMP.txt" 2>/dev/null || echo "[!] smbclient returned non-zero status or requires auth"

# 8) FTP banner / anonymous check (best-effort)
timeout 10 bash -c "cat <(echo) | ftp -v -n $TARGET" > "$OUTDIR/scans/ftp_banner_$TIMESTAMP.txt" 2>&1 || true
curl -I "ftp://$TARGET" > "$OUTDIR/scans/ftp_curl_$TIMESTAMP.txt" 2>/dev/null || true

# 9) Extract services from nmap xml and run searchsploit (best-effort)
if [ -f "$OUTDIR/scans/nmap_full_$TIMESTAMP.xml" ]; then
  grep -Eo 'service name="[^"]+' "$OUTDIR/scans/nmap_full_$TIMESTAMP.xml" | sed -E 's/service name="//' | sort -u > "$OUTDIR/scans/nmap_services_$TIMESTAMP.txt" || true
else
  echo "[!] Nmap xml not found, skipping automated searchsploit collection" > "$OUTDIR/scans/nmap_services_$TIMESTAMP.txt"
fi

while read -r service; do
  if [ -n "$service" ]; then
    echo "[*] searchsploit for: $service" >> "$OUTDIR/scans/searchsploit_$TIMESTAMP.txt"
    searchsploit "$service" >> "$OUTDIR/scans/searchsploit_$TIMESTAMP.txt" || true
  fi
done < "$OUTDIR/scans/nmap_services_$TIMESTAMP.txt" || true

# 10) Non-destructive Metasploit auxiliary scans logging to file
msfconsole -q -x "spool $OUTDIR/msflogs/msf_$TIMESTAMP.txt; use auxiliary/scanner/ftp/ftp_version; set RHOSTS $TARGET; run; use auxiliary/scanner/smb/smb_version; set RHOSTS $TARGET; run; spool off; exit" || echo "[!] Metasploit returned non-zero status or msfconsole not found"

echo "[*] VAPT run complete. Check $OUTDIR/scans and $OUTDIR/msflogs for outputs."

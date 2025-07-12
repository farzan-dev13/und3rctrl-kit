#!/bin/sh
#
# find-webshells.sh
# Scan common directories for potentially malicious webshells (PHP/JSP/etc.)
# Author: Farzan Afringan
# License: MIT

# Define target directories to scan
TARGET_DIRS="/tmp /var/www /home /srv /opt"

# Define suspicious patterns (encoded payloads, common webshell functions, etc.)
SUSPICIOUS_PATTERNS="base64_decode|eval|system|exec|passthru|shell_exec|cmd|popen"

echo "🔍 Scanning for potentially malicious files..."

for dir in $TARGET_DIRS; do
  echo "Scanning directory: $dir"
  find "$dir" -type f \( -iname "*.php" -o -iname "*.jsp" -o -iname "*.asp" -o -iname "*.sh" \) 2>/dev/null | while read -r file; do
    if grep -Ei "$SUSPICIOUS_PATTERNS" "$file" >/dev/null 2>&1; then
      echo "[!] Suspicious content found in: $file"
    fi
  done
done

echo "✅ Scan completed."

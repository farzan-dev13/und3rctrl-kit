#!/bin/sh
# find-webshells.sh
# Scan for potentially malicious webshells in PHP/JSP/ASP/Shell scripts.
# Version: 1.1.0
# Author: Farzan Afringan
# License: MIT

# Default target directories (if no argument provided)
TARGET_DIRS="/tmp /var/www /home /srv /opt"
SUMMARY_ONLY=false

# Handle input arguments
if [ "$1" = "--summary" ]; then
  SUMMARY_ONLY=true
elif [ -n "$1" ]; then
  TARGET_DIRS="$1"
fi

# Define suspicious patterns commonly found in webshells
SUSPICIOUS_PATTERNS="base64_decode|eval|system|exec|passthru|shell_exec|cmd|popen"

total=0
suspicious=0

echo "🔍 Starting webshell scan..."

for dir in $TARGET_DIRS; do
  [ -d "$dir" ] || continue
  echo "📁 Scanning directory: $dir"
  find "$dir" -type f \( -iname "*.php" -o -iname "*.jsp" -o -iname "*.asp" -o -iname "*.sh" \) 2>/dev/null | while read -r file; do
    total=$((total + 1))
    if grep -Ei "$SUSPICIOUS_PATTERNS" "$file" >/dev/null 2>&1; then
      suspicious=$((suspicious + 1))
      $SUMMARY_ONLY || echo "[!] Suspicious content found in: $file"
    fi
  done
done

echo "✅ Scan completed."
echo "🔢 Total files scanned: $total"
echo "⚠️  Suspicious files found: $suspicious"

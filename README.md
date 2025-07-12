# und3rctrl-kit

A lightweight collection of post-exploitation tools written in pure shell script (POSIX compliant).  
Perfect for red teamers, pentesters, and sysadmins who want clean and minimal audit tools.

## 📁 Tools Included

| Tool | Description |
|------|-------------|
| [`find-webshells.sh`](tools/find-webshells.sh) | Scan common directories (like `/tmp`, `/var/www`, etc.) for suspicious webshells (PHP/JSP/ASP) using keyword patterns like `eval`, `base64_decode`, `system`, etc. |
|------|-------------|
| [`find-webshells-v2.sh`](tools/find-webshells-v2.sh) | Scan common or custom directories for suspicious PHP/JSP/ASP scripts using keywords like `eval`, `base64_decode`, `system`. Includes summary mode and file counters. |





> All tools are portable and work on most Linux distributions including Alpine, Ubuntu, Debian, Arch, etc.

## ⚙️ Features
- Written in pure shell (no external dependencies)
- Easy to read, audit, and extend
- Suitable for use in custom recovery or incident response environments

✅ Ubuntu (Debian-based)

✅ AlmaLinux (RHEL-based)

✅ Alpine Linux (BusyBox-based)


## 📜 License

MIT — feel free to fork, contribute, or integrate.

---

💡 New tools will be added regularly. Stay tuned!

#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode


# Variabel konfigurasi

# Konfigurasi DNS IP (gunakan satu IP untuk TCP & UDP)
DNS_IP="1.1.1.1"
DNS_PORT=53

# Flush aturan lama (hanya aturan DNAT port 53 di chain OUTPUT)
iptables -t nat -D OUTPUT -p tcp --dport $DNS_PORT -j DNAT --to-destination $DNS_IP:$DNS_PORT 2>/dev/null
iptables -t nat -D OUTPUT -p udp --dport $DNS_PORT -j DNAT --to-destination $DNS_IP:$DNS_PORT 2>/dev/null

# Tambahkan aturan prioritas di urutan atas
iptables -t nat -I OUTPUT -p tcp --dport $DNS_PORT -j DNAT --to-destination $DNS_IP:$DNS_PORT
iptables -t nat -I OUTPUT -p udp --dport $DNS_PORT -j DNAT --to-destination $DNS_IP:$DNS_PORT

echo "[service.sh] Aturan iptables DNS telah dioptimalkan dan diterapkan."

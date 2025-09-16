# NetworkTweakV6 - Magisk Module

A comprehensive network optimization module for Android devices using Magisk, designed to improve internet connectivity, reduce ping, and enhance overall network performance.

## 📋 Description

NetworkTweakV6 is a Magisk module that applies various network tweaks and optimizations to Android devices. It combines Google DNS (8.8.8.8) and Cloudflare DNS (1.1.1.1) configurations with advanced TCP/IP optimizations, iptables rules, and system property modifications to deliver better internet performance.

## ✨ Features

### 🌐 DNS Optimization
- **Dual DNS Setup**: Combines Google DNS (8.8.8.8) and Cloudflare DNS (1.1.1.1)
- **Multiple Interface Support**: Configures DNS for all network interfaces (WiFi, Mobile Data, Ethernet)
- **IPv4 & IPv6 Support**: Full support for both IP protocols
- **System-wide DNS**: Modifies system properties and resolv.conf for comprehensive DNS coverage

### ⚡ Network Performance Enhancements
- **TCP Buffer Optimization**: Optimized buffer sizes for different connection types (WiFi, LTE, UMTS, etc.)
- **Advanced TCP Settings**: Enables SACK, FACK, window scaling, and other performance features
- **Memory Management**: Optimized network memory allocation (wmem_max, rmem_max)
- **Connection Management**: Improved TCP connection handling and timeouts

### 📶 Mobile Network Improvements
- **RIL Optimizations**: Enhanced Radio Interface Layer settings
- **Signal Enhancements**: Better signal processing and network selection
- **Data Connection**: Improved mobile data connectivity and stability
- **Network Technology Support**: Optimizations for 3G, 4G, LTE, and LTE-A

### 🎵 Audio Enhancements
- **High-Quality Bluetooth Codecs**: Enables aptX, aptX HD, aptX Adaptive, LDAC, and AAC codecs
- **Audio Offloading**: Improved Bluetooth audio processing and hardware offloading
- **Connection Stability**: Better Bluetooth device pairing and connectivity
- **Call Voice Quality**: Enhanced AMR wideband for better call audio
- **Advanced Audio Features**: TWS+ support, split A2DP, and frame control optimizations

### 🔧 System Optimizations
- **Kernel Parameters**: Direct kernel network parameter tuning via /proc/sys
- **iptables Rules**: Smart DNS redirection using iptables DNAT rules
- **Property Injection**: System property modifications for network behavior

## 🛠️ How It Works

### Installation Process (`install.sh`)
1. Displays installation information and changelog
2. Extracts module files to the Magisk module directory
3. Sets appropriate permissions for all files
4. Configures the module for automatic execution

### Boot-time Initialization (`post-fs-data.sh`)
- Executes during Android's post-fs-data phase
- Sets DNS properties for all network interfaces
- Configures IPv6 DNS settings
- Modifies `/system/etc/resolv.conf` if it exists

### Runtime Service (`service.sh`)
- Runs during late_start service mode
- Implements iptables DNS redirection rules
- **Key Improvements in V6**:
  - Unified DNS IP (1.1.1.1) for both TCP and UDP traffic
  - Removes old rules before adding new ones to prevent duplication
  - Uses `-I` (insert) option for higher priority rules
  - Cleaner code with better logging

### System Properties (`system.prop`)
- **Internet Tweaks**: TCP buffer sizes for various connection types
- **Wireless & TCP Optimizations**: Core network parameters
- **DNS Settings**: Comprehensive DNS configuration
- **Signal Tweaks**: Mobile network optimizations
- **Audio Enhancements**: 
  - Bluetooth codec optimizations (aptX, aptX HD, LDAC, AAC)
  - Call voice quality improvements (AMR wideband)
  - Advanced audio features (TWS+, A2DP splitting)

### Kernel Tweaks (`netspeed`)
- Direct kernel parameter modification
- TCP timestamp, window scaling, and SACK optimizations
- Memory buffer fine-tuning
- Connection timeout optimizations

## 📦 Installation

### Prerequisites
- Rooted Android device
- Magisk installed and working
- Magisk Manager or similar module management app

### Installation Steps
1. Download the NetworkTweakV6 module ZIP file
2. Open Magisk Manager
3. Go to Modules section
4. Tap "Install from storage"
5. Select the downloaded ZIP file
6. Reboot your device

## 🔄 Changelog - Version 6 Improvements

The following improvements have been applied to `service.sh`:

1. **Unified IP for TCP & UDP**: Both TCP and UDP DNS traffic are now directed to 1.1.1.1, simplifying configuration and improving efficiency
2. **Removed old rules before adding new ones**: Existing iptables DNAT rules for port 53 in the OUTPUT chain are cleared first to prevent duplication
3. **Inserted new rules with higher priority**: New iptables rules use the `-I` (insert) option to ensure they're placed at the top of the chain
4. **Removed unnecessary functions and variables**: Script is now more concise, eliminating separate TCP/UDP variables and rule-check functions
5. **Added logging**: Log messages are displayed when iptables rules are applied, making monitoring and debugging easier

**Result**: The script is now more efficient, cleaner, and less prone to rule duplication.

## 🎯 Expected Benefits

- **Lower Ping**: Reduced latency through DNS and routing optimizations
- **Faster Connection**: Improved connection establishment and data transfer
- **Better Stability**: More stable network connections across different network types
- **Enhanced Audio Quality**: 
  - Higher quality Bluetooth audio with premium codecs (aptX HD, LDAC)
  - Clearer voice calls with AMR wideband
  - Better wireless audio device compatibility
- **Improved Coverage**: Better mobile signal reception and network selection

## ⚙️ Technical Details

### DNS Configuration
- Primary DNS: 8.8.8.8 (Google)
- Secondary DNS: 1.1.1.1 (Cloudflare)
- IPv6 DNS: 2001:4860:4860::8888, 2606:4700:4700::1111

### iptables Rules
```bash
iptables -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 1.1.1.1:53
iptables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 1.1.1.1:53
```

### Key System Properties
- `net.tcp.buffersize.lte=524288,1048576,2097152,524288,1048576,2097152`
- `net.core.wmem_max=1048576`
- `net.ipv4.tcp_window_scaling=1`
- `persist.telephony.support.ipv6=1`

## 📱 Compatibility

- **Android Versions**: Android 5.0+ (API 21+)
- **Architecture**: ARM, ARM64, x86, x86_64
- **Magisk Version**: 18.0+
- **Root Method**: Magisk (Systemless)

## ⚠️ Important Notes

- This module makes system-level network changes
- Some tweaks may not work on all devices or Android versions
- Changes are applied systemlessly through Magisk
- Uninstalling the module will revert all changes
- No warranty provided - use at your own discretion

## 🔧 Troubleshooting

### Common Issues
1. **Module not working**: Ensure Magisk is properly installed and up to date
2. **No internet after installation**: Try disabling the module and rebooting
3. **DNS not changing**: Check if your device/ROM overrides DNS settings
4. **Bluetooth audio issues**: Some devices may not support all codecs

### Debugging
- Check Magisk logs for installation errors
- Use `logcat` to monitor system behavior
- Verify iptables rules: `iptables -t nat -L OUTPUT`

## 👥 Credits

- **Original Author**: IMMIX
- **Modified by**: Ian7672 (github.com/Ian7672)
- **Telegram Group**: @immix_builds
- **Framework**: Magisk by topjohnwu

## 💖 Support

If you find this module helpful, consider supporting the developer:
- **Ko-fi**: Ian7672
- **PayPal**: luqmanijsp
- **Trakteer**: Ian7672
- **Links**: Ian7672

## 📄 License

This project is provided as-is without any warranty. Use at your own risk.

---

**Note**: This module requires root access and modifies system network behavior. Always test in a safe environment before daily use.
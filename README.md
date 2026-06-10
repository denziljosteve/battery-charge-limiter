# 🔋 Battery Charge Limiter

A lightweight Linux utility for managing laptop battery charging thresholds and extending battery lifespan.

Battery Charge Limiter automatically detects your laptop battery (`BAT0`, `BAT1`, etc.), applies configurable charging thresholds, and ensures they persist across reboots using `systemd`.

---

## ✨ Features

* Automatic battery detection (`BAT0`, `BAT1`, etc.)
* Persistent charge thresholds across reboots
* Systemd integration
* Configurable start and stop charging percentages
* Zero external dependencies
* Lightweight Bash implementation
* Works with Linux Mint, Ubuntu, Debian, Fedora, Arch Linux, and most modern Linux distributions
* Designed for laptops exposing Linux battery threshold interfaces

---

## Why Use Battery Charge Limits?

Lithium-ion batteries degrade faster when kept at 100% charge for extended periods.

Using a charge limit can:

* Reduce battery wear
* Lower battery temperatures
* Extend overall battery lifespan
* Improve long-term battery health

### Recommended Limits

| Usage Scenario     | Start Charging | Stop Charging |
| ------------------ | -------------- | ------------- |
| Maximum Lifespan   | 55%            | 60%           |
| Balanced Daily Use | 75%            | 80%           |
| Travel Mode        | 95%            | 100%          |

---

# Supported Hardware

This project works only if your laptop exposes battery threshold controls through the Linux kernel.

Check support:

```bash
ls /sys/class/power_supply/BAT0/
```

or

```bash
ls /sys/class/power_supply/BAT1/
```

You must see:

```text
charge_control_start_threshold
charge_control_end_threshold
```

If these files do not exist, your hardware or BIOS does not expose battery threshold controls.

---

# Tested Hardware

## Dell

* Dell Vostro Series
* Dell Latitude Series
* Dell XPS Series
* Dell Inspiron Series

## Lenovo

* ThinkPad Series
* ThinkBook Series
* Legion Series

## ASUS

* ZenBook Series
* VivoBook Series
* ROG Series

## Acer

* Swift Series
* Aspire Series

## HP

* EliteBook Series
* ProBook Series

Support varies by model and BIOS version.

---

# Repository Structure

```text
battery-charge-limiter/
│
├── README.md
├── LICENSE
├── CHANGELOG.md
│
├── install.sh
├── uninstall.sh
│
├── config/
│   └── battery-limit.conf
│
├── scripts/
│   ├── battery-limit.sh
│   ├── detect-battery.sh
│   ├── set-threshold.sh
│   └── status.sh
│
├── systemd/
│   └── battery-limit.service
│
└── docs/
    ├── INSTALLATION.md
    ├── CONFIGURATION.md
    ├── TROUBLESHOOTING.md
    ├── SUPPORTED-HARDWARE.md
    └── FAQ.md
```

---

# Installation

## Clone Repository

```bash
git clone https://github.com/denziljosteve/battery-charge-limiter.git

cd battery-charge-limiter
```

---

## Make Installer Executable

```bash
chmod +x install.sh
```

---

## Run Installer

```bash
./install.sh
```

The installer will:

* Detect the battery automatically
* Validate threshold support
* Install scripts
* Install configuration
* Install systemd service
* Enable persistence across reboots

---

# Configuration

Edit the configuration file:

```bash
sudo nano /etc/battery-limit.conf
```

Default configuration:

```ini
START_THRESHOLD=55
END_THRESHOLD=60
```

---

## Examples

### Maximum Battery Lifespan

```ini
START_THRESHOLD=55
END_THRESHOLD=60
```

### Balanced Usage

```ini
START_THRESHOLD=75
END_THRESHOLD=80
```

### Full Capacity

```ini
START_THRESHOLD=95
END_THRESHOLD=100
```

---

# Apply Configuration Changes

After editing the configuration:

```bash
sudo systemctl restart battery-limit
```

---

# Check Current Status

```bash
battery-status
```

Example output:

```text
Battery: BAT0

Current Charge: 58%
Status: Charging

Start Threshold: 55%
End Threshold: 60%

Cycle Count: 421
```

---

# Verify Thresholds

```bash
cat /sys/class/power_supply/BAT0/charge_control_start_threshold

cat /sys/class/power_supply/BAT0/charge_control_end_threshold
```

Expected output:

```text
55
60
```

---

# Systemd Service

Check service status:

```bash
systemctl status battery-limit
```

Restart service:

```bash
sudo systemctl restart battery-limit
```

Enable service:

```bash
sudo systemctl enable battery-limit
```

Disable service:

```bash
sudo systemctl disable battery-limit
```

---

# Uninstallation

Run:

```bash
chmod +x uninstall.sh

./uninstall.sh
```

This removes:

* Installed scripts
* Configuration files
* Systemd service
* Service symlinks

---

# Troubleshooting

## Threshold Files Missing

Check:

```bash
ls /sys/class/power_supply/BAT0/
```

If threshold files are absent:

* BIOS may not support battery thresholds
* Vendor kernel module may be missing
* Laptop firmware may not expose charging controls

---

## Service Not Starting

Check status:

```bash
systemctl status battery-limit
```

Check logs:

```bash
journalctl -u battery-limit
```

---

## Battery Not Detected

Verify:

```bash
ls /sys/class/power_supply/
```

Expected:

```text
AC
BAT0
```

or

```text
AC
BAT1
```

---

# Battery Health Tips

For users who keep laptops plugged in most of the time:

### Best Battery Health

```ini
START_THRESHOLD=55
END_THRESHOLD=60
```

### Daily Mixed Usage

```ini
START_THRESHOLD=75
END_THRESHOLD=80
```

### Frequent Travel

```ini
START_THRESHOLD=95
END_THRESHOLD=100
```

---

# Security

Battery Charge Limiter:

* Does not require internet access
* Does not collect telemetry
* Does not send data externally
* Runs entirely on your local machine

---

# Contributing

Contributions are welcome.

Feel free to:

* Submit pull requests
* Open feature requests
* Report bugs
* Improve hardware compatibility

---

# License

MIT License

See the LICENSE file for details.

---

# Acknowledgements

This project relies on Linux kernel battery interfaces exposed through:

```text
/sys/class/power_supply/
```

Thanks to Linux kernel developers and laptop vendors that expose battery threshold controls through standard Linux power interfaces.

---

# Author

Your Name

GitHub: https://github.com/YOUR_USERNAME

---

## Star the Project

If this project helps extend your battery lifespan, consider giving it a ⭐ on GitHub.

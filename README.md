# System Monitoring Script

This script monitors the system's health by checking disk usage, CPU usage, and memory usage. It alerts the user if any of these resources exceed a specified threshold (default is 70%).

## Requirements

- Bash shell (compatible with most Linux/macOS systems)
- Tools used: `df`, `top`, `free`, `awk`, `bc`

## Usage

1. **Download the script**:
   Save the `system_monitor.sh` script to your machine.

2. **Make the script executable**:
   Run the following command:
   ```bash
   chmod +x system_monitor.sh
   ```

3. **Run the script**:
   Execute it with:
   ```bash
   ./system_monitor.sh
   ```

   A detailed report of your system's current resource usage will be displayed, with warnings if any exceed the threshold.

## Script Features

### 1. **Disk Usage**
   - Displays disk usage excluding snap mounts.
   - Prints a red warning if any partition is above the threshold.

### 2. **CPU Usage**
   - Calculates total CPU usage.
   - Displays a red warning if usage exceeds the threshold.

### 3. **Memory Usage**
   - Shows total, used, free, and cached memory.
   - Displays a red warning if used memory exceeds the threshold.

### 4. **Top Memory-Consuming Processes**
   - Lists the top 5 processes consuming the most memory.

## Customization

- **Change threshold**:  
  Edit the `THRESHOLD` variable at the top of the script. Default is 70.
  ```bash
  THRESHOLD=70
  ```

## Sample Output

```
System Monitoring Alert - 2025-05-10 12:00:00

System Monitoring Report - 2025-05-10 12:00:00
=========================================

Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   35G   15G  70% /

==================

CPU Usage:
Current CPU Usage: 75.3%
Warning: The CPU usage percentage is greater than 70%

=========================================
Memory Usage:
Total Memory       : 3.2 GB
Used Memory        : 2.5 GB
Buff/Cached Memory : 0.5 GB
Free Memory        : 0.2 GB
Warning: The Used memory percentage is greater than 70%

=========================================
   PID  COMM  %MEM
   1234 firefox  5.2
   2345 chrome   3.8
   3456 python   2.3
   4567 apache2  1.9
   5678 mysqld   1.7
```

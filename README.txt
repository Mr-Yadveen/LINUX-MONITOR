LINUX SYSTEM RESOURCE MONITOR
==============================

Project type: Linux mini project
Language: Bash shell scripting

FEATURES
- Displays hostname, current user, date, kernel and uptime.
- Shows CPU details and system load.
- Displays RAM and swap usage.
- Displays mounted filesystem usage.
- Lists the ten processes using the most CPU.
- Generates a dated text report in ~/linux_monitor_logs/.

REQUIREMENTS
- A Linux distribution (Ubuntu, Debian, Fedora, Linux Mint, etc.)
- Bash shell
- Standard commands: lscpu, free, df, ps, uptime, uname, date

HOW TO RUN
1. Open Terminal and move to the folder containing linux_resource_monitor.sh.
2. Make the script executable:
      chmod +x linux_resource_monitor.sh
3. Run it:
      ./linux_resource_monitor.sh
4. Select an option from the menu.
5. Choose option 6 to save a complete report.

NOTES
- No root/sudo permission is required for normal use.
- The script reads system information; it does not change system settings.
- If lscpu is unavailable, the script attempts to read CPU details from /proc/cpuinfo.

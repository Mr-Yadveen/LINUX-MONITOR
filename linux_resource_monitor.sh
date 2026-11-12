#!/usr/bin/env bash
# Linux System Resource Monitor
# A beginner-friendly mini project using standard Linux commands.

set -u

LOG_DIR="${HOME}/linux_monitor_logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/resource_log_$(date +%F).txt"

line() {
    printf '%s\n' "------------------------------------------------------------"
}

show_cpu() {
    echo "CPU information"
    if command -v lscpu >/dev/null 2>&1; then
        lscpu | grep -E 'Model name|CPU\(s\)|Architecture' | head -n 5
    else
        grep -m 1 'model name' /proc/cpuinfo || echo "CPU details unavailable"
    fi
    echo
    echo "Current load average:"
    uptime
}

show_memory() {
    echo "Memory usage"
    free -h
}

show_disk() {
    echo "Disk usage"
    df -hT -x tmpfs -x devtmpfs
}

show_processes() {
    echo "Top processes by CPU usage"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
}

show_system() {
    echo "System information"
    echo "Hostname: $(hostname)"
    echo "Date:     $(date)"
    echo "Uptime:   $(uptime -p 2>/dev/null || uptime)"
    echo "Kernel:   $(uname -r)"
    echo "User:     $(whoami)"
}

save_report() {
    {
        line
        echo "LINUX SYSTEM RESOURCE REPORT"
        echo "Generated: $(date)"
        line
        show_system
        line
        show_cpu
        line
        show_memory
        line
        show_disk
        line
        show_processes
        line
    } | tee "$LOG_FILE"
    echo
    echo "Report saved to: $LOG_FILE"
}

while true; do
    clear
    echo "=============================================="
    echo "       LINUX SYSTEM RESOURCE MONITOR"
    echo "=============================================="
    echo "1. View system information"
    echo "2. View CPU and load information"
    echo "3. View memory usage"
    echo "4. View disk usage"
    echo "5. View top running processes"
    echo "6. Generate and save complete report"
    echo "7. Exit"
    echo "----------------------------------------------"
    read -r -p "Enter your choice [1-7]: " choice

    case "$choice" in
        1) clear; show_system; read -r -p "Press Enter to continue..." ;;
        2) clear; show_cpu; read -r -p "Press Enter to continue..." ;;
        3) clear; show_memory; read -r -p "Press Enter to continue..." ;;
        4) clear; show_disk; read -r -p "Press Enter to continue..." ;;
        5) clear; show_processes; read -r -p "Press Enter to continue..." ;;
        6) clear; save_report; read -r -p "Press Enter to continue..." ;;
        7) echo "Thank you for using the monitor."; exit 0 ;;
        *) echo "Invalid choice. Please enter a number from 1 to 7."; sleep 1 ;;
    esac
done

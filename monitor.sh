#!/bin/bash

# Get the network interface name dynamically
interface=$(ip route | grep default | awk '{print $5}')

# Function to display top 10 most used applications
top_apps() {
    echo "Top 10 Applications by CPU Usage:"
    ps aux --sort=-%cpu | head -n 11
    echo "Top 10 Applications by Memory Usage:"
    ps aux --sort=-%mem | head -n 11
}

# Function for network monitoring
network_monitor() {
    echo "Number of connections:"
    netstat -an | grep ESTABLISHED | wc -l
    echo "Packet drops:"
    ifconfig $interface | grep 'RX packets'
    ifconfig $interface | grep 'TX packets'
}

# Function for disk usage
disk_usage() {
    echo "Disk Usage:"
    df -h
    echo "Partitions using more than 80% space:"
    df -h | awk '$5 > 80'
}

# Function for system load
system_load() {
    echo "System Load:"
    uptime
    echo "CPU Usage Breakdown:"
    top -b -n1 | grep "Cpu(s)"
}

# Function for memory usage
memory_usage() {
    echo "Memory Usage:"
    free -m
}

# Function for process monitoring
process_monitor() {
    echo "Top 5 Processes by CPU Usage:"
    ps aux --sort=-%cpu | head -n 6
}

# Function for service monitoring
service_monitor() {
    echo "Service Status for sshd and nginx:"
    systemctl status sshd
    systemctl status nginx
}

# Main script logic
refresh_rate=5  # Set refresh rate in seconds

while true; do
    clear
    if [ -z "$1" ]; then
        echo "Executing all monitoring tasks..."
        top_apps
        network_monitor
        disk_usage
        system_load
        memory_usage
        process_monitor
        service_monitor
    else
        case $1 in
            -cpu)
                system_load
                ;;
            -memory)
                memory_usage
                ;;
            -network)
                network_monitor
                ;;
            -disk)
                disk_usage
                ;;
            -apps)
                top_apps
                ;;
            -process)
                process_monitor
                ;;
            -service)
                service_monitor
                ;;
            *)
                echo "Usage: $0 {-cpu|-memory|-network|-disk|-apps|-process|-service}"
                ;;
        esac
    fi
    sleep $refresh_rate
done

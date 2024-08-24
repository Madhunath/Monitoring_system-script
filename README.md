# System Monitoring Script

## Overview

This script provides real-time monitoring of various system metrics, including CPU usage, memory usage, disk usage, network statistics, and service statuses. It is designed to be run in a loop with a configurable refresh rate, and it supports command-line options to display specific metrics.

## Features

- **Top Applications**: Displays the top 10 applications by CPU and memory usage.
- **Network Monitoring**: Shows the number of established network connections and packet drop statistics.
- **Disk Usage**: Provides disk usage statistics and identifies partitions using more than 80% of their space.
- **System Load**: Displays system load averages and CPU usage breakdown.
- **Memory Usage**: Shows memory usage statistics.
- **Process Monitoring**: Lists the top 5 processes by CPU usage.
- **Service Monitoring**: Checks the status of `sshd` and `nginx` services.

## Prerequisites

- A Linux-based system
- Basic knowledge of Linux command-line operations

## Usage

1. **Download the Script**: Save the script to a file, e.g., `system_monitor.sh`.
2. **Make the Script Executable**:
   
   chmod +x system_monitor.sh

## Run The Script

   sudo ./monitor.sh

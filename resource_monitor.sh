#!/bin/bash
# System resource monitoring script

LOGFILE="/var/log/resource_monitor.log"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2+$4}')
MEM=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

echo "$(date) | CPU Usage: $CPU% | Memory Usage: $MEM%" >> $LOGFILE

#!/bin/bash
# Disk usage monitoring script

THRESHOLD=80
LOGFILE="/var/log/disk_monitor.log"

echo "Disk Usage Report - $(date)" >> $LOGFILE

df -h | grep '^/' | while read fs size used avail percent mount
do
  usage=${percent%\%}
  if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "ALERT: $fs mounted on $mount is ${usage}% full" >> $LOGFILE
  fi
done

#!/bin/bash
# Log cleanup script

LOG_DIR="/var/log"
DAYS=7
LOGFILE="/var/log/log_cleanup.log"

echo "Log cleanup started: $(date)" >> $LOGFILE

find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -print -delete >> $LOGFILE 2>&1

echo "Log cleanup completed: $(date)" >> $LOGFILE

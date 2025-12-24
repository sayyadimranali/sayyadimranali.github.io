#!/bin/bash
# Service health check script

SERVICES=("sshd" "cron")
LOGFILE="/var/log/service_monitor.log"

for service in "${SERVICES[@]}"
do
  systemctl is-active --quiet $service
  if [ $? -ne 0 ]; then
    echo "$(date): $service is DOWN. Restarting..." >> $LOGFILE
    systemctl restart $service
  else
    echo "$(date): $service is running" >> $LOGFILE
  fi
done

#!/bin/bash
# Usage: ./check-site.sh https://customer1.local
SITE=$1
LOG_FILE="/var/log/site_checks.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ -z "$SITE" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

# Requirement: Check status code and measure response time
# -w provides the format: [http_code] [time_total]
RESULT=$(curl -k -s -o /dev/null -w "%{http_code} %{time_total}" "$SITE")

echo "[$TIMESTAMP] SITE: $SITE | STATUS/TIME: $RESULT" >> "$LOG_FILE"

#!/bin/sh

if [ -n "$TZ" ]; then
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  echo $TZ > /etc/timezone
fi

if [ -f /app/requirements.txt ]; then
  echo "requirements.txt found"
  pip install --no-cache-dir -r /app/requirements.txt
else
  echo "requirements.txt notfound"
fi

chmod +x /app/*

exec supervisord "$@"
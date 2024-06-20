Python image for run Python Projects Flask - Django or src:main.py Supervisor Process Manager

this file is need for run:
```
── data
   ├── src
   │   ├── main.py
   │   └── requirements.txt
   └── supervisord.conf
```
supervisor.conf:
```
[supervisord]
user=root

[unix_http_server]
file=/tmp/supervisor.sock
chmod=0700
chown=nobody:nogroup

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[program:install_python_requirements]
directory=/app
command=/bin/sh -c "pip install --no-cache-dir -r requirements.txt"
autostart=true
autorestart=false

[program:src-python]
directory=/app
command=python3 /app/main.py
autostart=true
autorestart=true
```

run with docker compose:
```
version: '3'
services:
  acc-man:
    image: javidi/python-docker:latest
    container_name: app-test
    ports:
      - 5000:5000
    restart: unless-stopped
    volumes:
      - ./data/src:/app
      - ./data/supervisord.conf:/etc/supervisord.conf
```

#!/bin/bash
# podman-tutorial.sh
# Advanced interactive Podman container tutorial

clear
echo "==== Advanced Podman Tutorial ===="

echo "
Podman is a daemonless container engine that supports rootless containers.

In this tutorial:
- Pull and run containers
- Persistent volumes
- Inspect + logs
- Networking & cleanup
"

read -p "Continue? (y/n): " start
[[ "$start" != "y" ]] && exit 0

echo "
Step 1: Pull and Run Persistent Container
------------------------------------------
Command: podman run -dit --name web -p 8080:80 -v \$HOME/web-data:/usr/share/nginx/html:Z nginx

- Binds port 8080
- Mounts local content
- Uses :Z for SELinux compatibility
"

read -p "Run this demo container now? (y/n): " go
[[ "$go" == "y" ]] && mkdir -p ~/web-data && echo "<h1>Hello from Podman</h1>" > ~/web-data/index.html && podman run -dit --name web -p 8080:80 -v ~/web-data:/usr/share/nginx/html:Z nginx

echo "
Step 2: Container Introspection
-------------------------------
- podman ps
- podman inspect web
- podman logs web
- podman exec -it web /bin/bash
"

read -p "Run these now? (y/n): " inspect
[[ "$inspect" == "y" ]] && podman ps && podman inspect web && podman logs web

echo "
Step 3: Networking & Health
----------------------------
- podman network ls
- podman healthcheck run web
- podman port web
"

echo "
Step 4: System Cleanup
-----------------------
- podman stop web
- podman rm web
- podman image prune -f
"

read -p "Stop and remove the web container now? (y/n): " cleanup
[[ "$cleanup" == "y" ]] && podman stop web && podman rm web

echo "
Tutorial complete. Review: man podman, podman-compose, podman generate systemd
"
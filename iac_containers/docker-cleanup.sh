#!/bin/bash
# docker-cleanup.sh

echo "==== Docker Cleanup ===="

echo "Stopping and removing all stopped containers..."
docker container prune -f

echo "Removing dangling images..."
docker image prune -f

echo "Removing unused volumes..."
docker volume prune -f

echo "Removing unused networks..."
docker network prune -f

echo "Docker cleanup completed."
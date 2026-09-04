#!/bin/bash

BACKUP_DIR="/var/backups/jenkins"

DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "Starting Jenkins backup..."

sudo mkdir -p $BACKUP_DIR

sudo tar -czf \
$BACKUP_DIR/jenkins-backup-$DATE.tar.gz \
/var/lib/jenkins

echo "Backup completed successfully!"

echo "Backup Location:"

ls -lh $BACKUP_DIR

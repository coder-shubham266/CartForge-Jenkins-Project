#!/bin/bash

DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo"Starting Jenkins Backup..."

sudo tar -czf /var/backups/jenkins/jenkins-backup-$DATE.tar.gz /var/lib/jenkins

echo "Backup completed successfully"

ls -lh /var/backups/jenkins

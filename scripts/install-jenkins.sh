#!/bin/bash

echo "====================================="
echo "Installing Jenkins CI Environment"
echo "====================================="

sudo apt update -y

echo "Installing Java..."

sudo apt install fontconfig openjdk-21-jre -y

echo "Adding Jenkins Repository..."

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y

echo "Installing Jenkins..."

sudo apt install jenkins -y

echo "Starting Jenkins..."

sudo systemctl enable jenkins

sudo systemctl start jenkins

echo "Jenkins Installation Completed!"

sudo systemctl status jenkins --no-pager

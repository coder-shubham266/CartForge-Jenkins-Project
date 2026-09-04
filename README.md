# CartForge – Jenkins Continuous Integration Environment

## Project Overview

This project demonstrates the implementation of a Continuous Integration (CI) environment using Jenkins for the CartForge application.

The main objective of this project is to understand how Jenkins automates the software development process. The project includes Jenkins installation and configuration, GitHub integration, Freestyle Jobs, Jenkins Pipeline, Jenkins Agent configuration, GitHub Webhooks, artifact generation, and pipeline monitoring.

The project was implemented using AWS EC2 instances running Ubuntu Linux.

---

# Jenkins Architecture

The CartForge Jenkins architecture consists of the following components:

* **GitHub Repository** – Stores the application source code and Jenkinsfile.
* **Jenkins Controller** – Manages Jenkins jobs, pipelines, and build processes.
* **Jenkins Agent** – Executes pipeline jobs and distributed builds.
* **GitHub Webhook** – Automatically triggers Jenkins when code is pushed to GitHub.
* **Jenkins Pipeline** – Automates the build, test, package, and artifact delivery process.

### Architecture Flow

```text
Developer
    |
    | Git Push
    v
GitHub Repository
    |
    | Webhook
    v
Jenkins Controller
    |
    | SSH Connection
    v
Jenkins Agent
    |
    | Build + Test + Package
    v
Jenkins Artifact
```

---

# Installation Steps

## 1. Launch Ubuntu EC2 Instance

An Ubuntu EC2 instance was launched on AWS to install and configure Jenkins.

## 2. Update the System

```bash
sudo apt update
sudo apt upgrade -y
```

## 3. Install Java

```bash
sudo apt install fontconfig openjdk-21-jre -y
```

Verify Java:

```bash
java -version
```

## 4. Install Jenkins

Add the Jenkins repository:

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
```

```bash
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
```

Update packages:

```bash
sudo apt update
```

Install Jenkins:

```bash
sudo apt install jenkins -y
```

## 5. Start Jenkins

```bash
sudo systemctl start jenkins
```

Enable Jenkins:

```bash
sudo systemctl enable jenkins
```

Check Jenkins status:

```bash
sudo systemctl status jenkins
```

## 6. Access Jenkins Dashboard

Jenkins can be accessed using:

```text
http://JENKINS-SERVER-PUBLIC-IP:8080
```

Complete the initial Jenkins setup and install the suggested plugins.

---

# Jenkins Configuration

The Jenkins environment was configured with the following tools:

* Java
* Jenkins
* Git
* Node.js
* npm

A Jenkins Administrator account was created after completing the initial setup.

A Freestyle Project was created to understand basic Jenkins job execution.

A Jenkins Pipeline was also created using a Jenkinsfile.

---

# Jenkins Agent Configuration

A separate Ubuntu EC2 instance was configured as a Jenkins Agent.

The Jenkins Agent was connected to the Jenkins Controller using SSH.

The Agent was configured with the following details:

```text
Name: CartForge-Agent

Remote Root Directory:
/home/ubuntu/jenkins

Label:
cartforge-agent

Launch Method:
Launch agents via SSH
```

The Jenkins Pipeline uses the following label:

```groovy
agent {
    label 'cartforge-agent'
}
```

This ensures that the CartForge Pipeline executes on the Jenkins Agent.

---

# Pipeline Workflow

The CartForge Jenkins Pipeline contains the following stages:

## 1. Clone Source Code

Jenkins downloads the application source code from the GitHub repository.

## 2. Install Dependencies

The required Node.js dependencies are installed using:

```bash
npm install
```

## 3. Build Application

The application is built using:

```bash
npm run build
```

## 4. Run Tests

Automated tests are executed using:

```bash
npm test
```

## 5. Package Application

The application files are packaged into a compressed artifact.

Example:

```text
cartforge-app.tar.gz
```

## 6. Deliver Artifact

The generated artifact is stored in Jenkins using Artifact Management.

### Pipeline Flow

```text
Clone Source Code
        |
        v
Install Dependencies
        |
        v
Build Application
        |
        v
Run Tests
        |
        v
Package Application
        |
        v
Deliver Artifact
```

---

# GitHub Webhook Integration

GitHub Webhook was configured to automatically trigger Jenkins builds.

Whenever code changes are pushed to the GitHub repository, GitHub sends a webhook request to Jenkins.

The workflow is:

```text
Developer Changes Code
        |
        v
Git Add
        |
        v
Git Commit
        |
        v
Git Push
        |
        v
GitHub Webhook
        |
        v
Jenkins Pipeline Triggered Automatically
        |
        v
Build and Test
        |
        v
Artifact Generated
```

This demonstrates Continuous Integration automation.

---

# Commands Used

## Jenkins Commands

Start Jenkins:

```bash
sudo systemctl start jenkins
```

Stop Jenkins:

```bash
sudo systemctl stop jenkins
```

Restart Jenkins:

```bash
sudo systemctl restart jenkins
```

Check Jenkins status:

```bash
sudo systemctl status jenkins
```

View Jenkins logs:

```bash
sudo journalctl -u jenkins
```

---

## Git Commands

Clone repository:

```bash
git clone https://github.com/coder-shubham266/CartForge-Jenkins-Project.git
```

Check repository status:

```bash
git status
```

Add changes:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Updated CartForge application"
```

Push changes:

```bash
git push origin main
```

---

## Node.js Commands

Install dependencies:

```bash
npm install
```

Build application:

```bash
npm run build
```

Run tests:

```bash
npm test
```

---

# Folder Structure

```text
CartForge-Jenkins-Project/
│
├── README.md
├── Jenkinsfile
├── pipeline-report.txt
│
├── app/
│   ├── package.json
│   ├── package-lock.json
│   └── application files
│
├── scripts/
│   ├── install-jenkins.sh
│   └── backup.sh
│
├── screenshots/
│   ├── jenkins-dashboard.png
│   ├── freestyle-job.png
│   ├── pipeline-stage-view.png
│   ├── agent-online.png
│   └── webhook-trigger.png
│
└── documentation/
    └── Project_Report.pdf
```

---

# Challenges Faced

During this project, several challenges were faced while configuring and implementing Jenkins.

### 1. Jenkinsfile Not Found

Initially, Jenkins was unable to locate the Jenkinsfile from the GitHub repository.

This issue was resolved by placing the Jenkinsfile in the correct location and configuring the correct Script Path and branch in Jenkins.

### 2. Jenkins Agent Configuration

Configuring the Jenkins Agent and connecting it to the Jenkins Controller using SSH required proper configuration of credentials, SSH access, and the Remote Root Directory.

### 3. GitHub Webhook Configuration

The GitHub Webhook required correct configuration of the Jenkins URL and network access to ensure that GitHub could successfully trigger Jenkins automatically.

### 4. Pipeline Errors

Some pipeline stages required troubleshooting related to dependencies, application folders, and Node.js commands.

These challenges helped improve practical troubleshooting and problem-solving skills.

---

# Learning Outcomes

Through this project, I gained practical experience in:

* Installing Jenkins on Ubuntu Linux.
* Configuring Jenkins security and administration.
* Integrating Jenkins with GitHub.
* Creating Jenkins Freestyle Jobs.
* Creating Jenkins Pipelines using Jenkinsfile.
* Understanding Pipeline as Code.
* Configuring Jenkins Agents.
* Understanding distributed builds.
* Installing and using Git, Node.js, and npm.
* Configuring GitHub Webhooks.
* Implementing Continuous Integration.
* Automating build and testing processes.
* Packaging application artifacts.
* Monitoring Jenkins Pipeline execution.
* Troubleshooting Jenkins and CI/CD issues.

---

# Conclusion

The CartForge Jenkins Continuous Integration Environment successfully demonstrates how Jenkins can automate important stages of the software development lifecycle.

By integrating GitHub, Jenkins Controller, Jenkins Agent, Pipeline as Code, and GitHub Webhooks, this project provides practical experience with a real-world Continuous Integration workflow.

This project helped me understand how DevOps tools are used at an industry level to automate software builds, testing, and artifact generation.

---

# Author

**Shubham Khade**

DevOps and AWS Student
**IT Vedant**

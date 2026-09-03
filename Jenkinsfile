pipeline {
    agent {
        label 'cartforge-agent'
    }

    stages {

        stage('Clone Source Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/coder-shubham266/CartForge-Jenkins-Project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('app') {
                    sh 'npm install'
                }
            }
        }

        stage('Build Application') {
            steps {
                dir('app') {
                    sh 'npm run build'
                }
            }
        }

        stage('Run Tests') {
            steps {
                dir('app') {
                    sh 'npm test'
                }
            }
        }

        stage('Package Application') {
            steps {
                sh '''
                mkdir -p artifact
                tar -czf artifact/cartforge-app.tar.gz app/
                '''
            }
        }

        stage('Deliver Artifact') {
            steps {
                archiveArtifacts artifacts: 'artifact/*.tar.gz',
                                 fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'CartForge Pipeline Completed Successfully!'
        }

        failure {
            echo 'CartForge Pipeline Failed!'
        }
    }
}

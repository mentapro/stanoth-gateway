pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh "docker build -t gateway ."
            }
        }
        stage('Deploy') {
            steps {
                sh "kubectl set image deployment/gateway gateway:latest"
            }
        }
    }
}
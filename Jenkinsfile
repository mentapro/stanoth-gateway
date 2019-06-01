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
                sh "kubectl set deployment/gateway gateway:latest"
            }
        }
    }
}
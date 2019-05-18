pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                def image = docker.build("gateway")
            }
        }
        stage('Deploy') {
            steps {
                sh "kubectl set image deployment/gateway gateway:latest"
            }
        }
    }
}
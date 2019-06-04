pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh "docker build -t gateway:${GIT_BRANCH}-${env.BUILD_NUMBER} ."
            }
        }
        stage('Deploy') {
            steps {
                sh "kubectl apply -f ./deployment.yml"
                sh "kubectl apply -f ./service.yml"
                sh "kubectl set image deploy/gateway gateway=gateway:${GIT_BRANCH}-${env.BUILD_NUMBER}"
            }
        }
    }
}
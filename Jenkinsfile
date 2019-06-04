pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh "docker build -t gateway:${env.BUILD_TAG} ."
            }
        }
        stage('Deploy') {
            steps {
                sh "kubectl apply -f ./deployment.yml"
                sh "kubectl set image deploy/gateway gateway=gateway:${env.BUILD_TAG}"
            }
        }
    }
}
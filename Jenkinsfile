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
                sh "kubectl apply -f ./deployment.yml"
                sh "kubectl set image deploy/gateway gameway"
            }
        }
    }
}
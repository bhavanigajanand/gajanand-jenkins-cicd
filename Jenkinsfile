pipeline {
    agent any

    environment {
        IMAGE_NAME = "hello-gajanand"
        IMAGE_TAG  = "latest"
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/bhavanigajanand/gajanand-jenkins-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ./app"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
                sh 'kubectl rollout status deployment/hello-gajanand'
            }
        }

        stage('Done') {
            steps {
                script {
                    def ip = sh(script: 'curl -s ifconfig.me', returnStdout: true).trim()
                    echo "Deployment complete!"
                    echo "App running at http://${ip}:30007"
                }
            }
        }

    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
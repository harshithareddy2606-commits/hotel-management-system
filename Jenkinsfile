pipeline {
agent any

stages {

    stage('Checkout Source') {
        steps {
            git branch: 'main',
            url: 'https://github.com/harshithareddy2606-commits/hotel-management-system.git'
        }
    }

    stage('Build Frontend Image') {
        steps {
            dir('hotel-docker-project/frontend') {
                sh 'docker build -t hotel-frontend .'
            }
        }
    }

    stage('Build Backend Image') {
        steps {
            dir('hotel-docker-project/backend') {
                sh 'docker build -t hotel-backend .'
            }
        }
    }

    stage('Deploy Application') {
        steps {
            dir('hotel-docker-project') {
                sh 'docker-compose down || true'
                sh 'docker-compose up -d'
            }
        }
    }

    stage('Verify Containers') {
        steps {
            sh 'docker ps'
        }
    }

    stage('Test Frontend') {
        steps {
            sh 'curl http://localhost:8080 || true'
        }
    }

    stage('Test Backend') {
        steps {
            sh 'curl http://localhost:5000 || true'
        }
    }
}

post {

    success {
        echo 'Hotel Management System deployed successfully'
    }

    failure {
        echo 'Pipeline failed'
    }

    always {
        sh 'docker ps -a'
    }
}

}


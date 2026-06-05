pipeline {
agent any

```
stages {

    stage('Checkout') {
        steps {
            git 'https://github.com/harshithareddy2606-commits/hotel-management-system.git'
        }
    }

    stage('Build Frontend') {
        steps {
            dir('frontend') {
                sh 'docker build -t hotel-frontend .'
            }
        }
    }

    stage('Build Backend') {
        steps {
            dir('backend') {
                sh 'docker build -t hotel-backend .'
            }
        }
    }

    stage('Deploy') {
        steps {
            sh 'docker-compose up -d'
        }
    }

    stage('Verify') {
        steps {
            sh 'docker ps'
        }
    }
}
```

}

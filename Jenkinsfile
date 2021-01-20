pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('build') {
            steps {
                sh 'which maven'
                sh 'mvn --version'
            }
        }
    }
}

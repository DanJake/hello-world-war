pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}

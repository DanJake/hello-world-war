pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('build') {
            steps {
              withMaven(maven: 'maven-3.6.3'){
                sh 'mvn clean'
                sh 'mvn deploy'
                sh 'mvn -Dmaven.test.skip=true'
              }
            }
        }
    }
}

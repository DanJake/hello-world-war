pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('build') {
            steps {
              withMaven(maven: 'maven-3.6.3'){
                sh 'mvn clean'
                sh 'mvn deploy'
              }
            }
        }
        stage('deploy') {
            steps {
              sshagent(['test_server_ssh']) {
              sh """
              ssh -o StrictHostKeyChecking=no maksym_zaloznyi@34.75.80.116 uptime'
              ssh maksym_zaloznyi@34.75.80.116 pwd
              ssh maksym_zaloznyi@34.75.80.116 whoami
               """
              }
            }
        }
    }
}

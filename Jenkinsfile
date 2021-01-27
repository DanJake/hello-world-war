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
              ssh -v jenkins@35.196.241.69
               """
              }
            }
        }
    }
}

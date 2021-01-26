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
              sshagent(credentials : ['test_server_ssh']) {
              sh """
               pwd >> pwd.txt
               whoami >> whoami.txt
               """
              }
            }
        }
    }
}

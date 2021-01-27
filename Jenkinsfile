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
                sh 'ssh -o StrictHostKeyChecking=no jenkins@35.196.241.69 uptime'
                sh 'ssh jenkins@35.196.241.69 /opt/tomcat/latest/bin/shutdown.sh'
                sh 'ssh jenkins@35.196.241.69 /opt/tomcat/latest/bin/startup.sh'
              }
            }
        }
    }
}

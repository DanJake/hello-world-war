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
                sh 'ssh jenkins@35.196.241.69 sudo curl -X GET "http://34.122.244.8:8081/repository/jenkins_artifacts/com/efsavage/hello-world-war/1.0.0/hello-world-war-1.0.0.war" -o /opt/tomcat/latest/webapps/websiteisdown.war'
                sh 'ssh jenkins@35.196.241.69 sudo systemctl stop tomcat'
                sh 'ssh jenkins@35.196.241.69 sudo systemctl start tomcat'
              }
            }
        }
    }
}

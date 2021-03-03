pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('SonarQube analysis') {
          steps {
              def scannerHome = tool 'SonarScanner 4.0';
              withSonarQubeEnv('sonar') { // If you have configured more than one global server connection, you can specify its name
                   sh "${scannerHome}/bin/sonar-scanner"
              }
          }
        }
        stage('build') {
            steps {
              withMaven(maven: 'maven-3.6.3', mavenSettingsConfig: 'mvn-setting-xml'){
                sh 'mvn clean'
                sh 'mvn deploy'
              }
            }
        }
    }
}

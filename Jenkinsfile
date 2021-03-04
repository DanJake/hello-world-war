pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('SonarQube analysis') {
          steps {
              withSonarQubeEnv('sonar') { 
                     sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
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


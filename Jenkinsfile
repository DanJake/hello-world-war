pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
        stage('build') {
          withMaven(
            mavenSettingsConfig: 'MySettings', //
            maven: 'maven-3.6.3' //
          ){
            sh 'mvn --version'
          }
        }
    }
}

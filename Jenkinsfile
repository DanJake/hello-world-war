pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
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

def myBuild = ""
pipeline {
    agent { label 'jenkins-slave-java' }
    stages {
      stage('SonarQube analysis') {
        steps {
            withSonarQubeEnv('sonar') {
                withMaven(maven: 'maven-3.6.3', mavenSettingsConfig: 'mvn-setting-xml'){
                   sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
                }
            }
        }
      }
      stage('build') {
          steps {
            withMaven(maven: 'maven-3.6.3', mavenSettingsConfig: 'mvn-setting-xml'){
              sh 'mvn clean'
              sh 'mvn install'
            }
          }
      }
      stage('docker') {
            steps {
              container('docker') {
                script {
                  myBuild = docker.build "us.gcr.io/precise-armor-304909/myweb:1.2"
                }
              }
            }
        }
        stage('upload') {
            steps {
              container('docker') {
                script {
                  docker.withRegistry('https://us.gcr.io', 'gcr:jenkins-sa') {
                    myBuild.push()
                  }
                }
              }
            }
        }
    }
}

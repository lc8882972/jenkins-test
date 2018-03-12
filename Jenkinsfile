pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh '''cd demo;
gradle test;'''
      }
    }
  }
}
pipeline {
  agent {
    kubernetes {
      cloud 'kubernetes'
      label 'jenkins-slave'
      containerTemplate {
        name 'gradle'
        image 'registry-vpc.cn-zhangjiakou.aliyuncs.com/k8s-jenkins/gradle:4.6.0-jdk8-alpine'
        ttyEnabled true
        command 'cat'
      }
      containerTemplate {
        name 'jnlp'
        image 'registry.cn-hangzhou.aliyuncs.com/google-containers/jnlp-slave:alpine'
        args '${computer.jnlpmac} ${computer.name}'
        command ''
      }
      persistentVolumeClaim {
        mountPath '/home/jenkins'
        claimName 'jenkins-slave'
        readOnly false
      }
      persistentVolumeClaim {
        mountPath '/root/.gradle'
        claimName 'gradle-repo'
        readOnly false
      }
      hostPathVolume {
        hostPath '/var/run/docker.sock'
        mountPath '/var/run/docker.sock'
      }
      hostPathVolume {
        hostPath '/tmp/'
        mountPath '/tmp/'
      }    
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('maven') {
          sh 'cd demo; gradle test'
        }
      }
    }
  }
}

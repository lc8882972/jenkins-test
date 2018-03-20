podTemplate(label: 'gradle-pod',  containers: [
    containerTemplate(
            name: 'gradle',
            image: 'registry-vpc.cn-zhangjiakou.aliyuncs.com/k8s-jenkins/gradle:4.6.0-jdk8-alpine',
            ttyEnabled: true,
            command: 'cat'
        ),
    containerTemplate(
            name: 'jnlp',
            image: 'registry.cn-hangzhou.aliyuncs.com/google-containers/jnlp-slave:alpine',
            args: '${computer.jnlpmac} ${computer.name}',
            command: ''
        )
  ]
  ,volumes: [
        persistentVolumeClaim(mountPath: '/home/jenkins', claimName: 'jenkins-slave', readOnly: false),
        persistentVolumeClaim(mountPath: '/root/.gradle', claimName: 'gradle-repo', readOnly: false),
        hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
        hostPathVolume(hostPath: '/tmp/', mountPath: '/tmp/')
]) 
{
    node ('gradle-pod') {
        
        container('gradle') {
            git url: 'https://github.com/lc8882972/jenkins-test.git', branch: 'master'

            sh 'echo Build spring boot 2.0 project'
            stage('Testing') {
                sh 'cd demo; gradle test'
            }
            
            stage('Build') {
                sh 'cd demo; gradle build;'
            }
        }
    }
}

pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage('Initialize'){
            steps{ def dockerHome = tool 'myDocker'
                   env.PATH = "${dockerHome}/bin:${env.PATH}"
                 }
            }
        stage('build and push') {
            steps { sh "docker build -t aymenchab/testing:tester ."
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh("docker push aymenchab/testing:tester")
                }
            }
            }
       stage ('make pod') {
           steps { sh("kubectl create -f pod.yml --namespace=test")
           }
           }
      stage ('create service') {
          steps { sh("kubectl create -f service.yml --namespace=test")
        }
        }
         }
}

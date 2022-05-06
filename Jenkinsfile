pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent {
        label 'ubuntu-1804 && amd64 && docker'
    }
    stages {
        stage('build and push') {
            sh "docker build -t aymenchab/testing:tester ."
            steps { withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
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

pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage ('install docker'){
            steps {sh"sudo curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
                      && sudo tar xzvf docker-17.04.0-ce.tgz \
                      && sudo mv docker/docker /usr/local/bin \
                      && sudo rm -r docker docker-17.04.0-ce.tgz"
                  }
          }
        stage('build and push') {
            steps { sh "sudo docker build -t aymenchab/testing:tester ."
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh("sudo docker push aymenchab/testing:tester")
                }
            }
            }
       stage ('make pod') {
           steps { sh("sudo kubectl create -f pod.yml --namespace=test")
           }
           }
      stage ('create service') {
          steps { sh("sudo kubectl create -f service.yml --namespace=test")
        }
        }
         }
}

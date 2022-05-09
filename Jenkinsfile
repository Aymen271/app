pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage ('install docker'){
            steps {sh"mv docker/docker /usr/local/bin \
                      && rm -r docker docker-17.04.0-ce.tgz"
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

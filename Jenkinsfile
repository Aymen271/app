pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage('build and push') {
            steps { 
                    sh"sudo docker logout"
                    sh"sudo docker build -t aymenchab/images:v1.1 ."                  
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh("docker push aymenchab/images:v1.1")
                }
            }
            }
       stage ('make pod') {
           steps {  
                   sh("sudo kubectl replace -f deployment.yml --namespace=test")
           }
           }
           stage ('make service') {
           steps {  
                   sh("sudo kubectl replace -f service.yml --namespace=test")
           }
           }
         }
}

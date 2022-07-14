pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        
        stage('build and push') {
            steps { 
                    sh "sudo docker logout"
                    sh "sudo curl -i -X DELETE   -H "Accept: application/json"   -H "Authorization: JWT $HUB_TOKEN"   https://hub.docker.com/v2/repositories/aymenchab/images/tags/1.3/"

                    sh"sudo docker rmi aymenchab/images:1.3"
                    sh"sudo docker build -t aymenchab/images:1.3 ."                  
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh"docker push aymenchab/images:1.3"
                }
            }
            }
       stage ('make pod') {
           steps {  
                   sh"sudo kubectl replace -f deployment.yml --namespace=test"
           }
           }
           stage ('make service') {
           steps {  
                   sh"sudo kubectl replace -f service.yml --namespace=test"
           }
           }
         }
}

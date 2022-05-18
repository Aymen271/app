pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage('build and push') {
            steps { 
                    sh"sudo docker build -t aymenchab/testing:t ."
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh("sudo docker push aymenchab/testing:t")
                }
            }
            }
       stage ('make pod') {
           steps {  
                   sh("sudo kubectl replace -f deployment.yml --namespace=test")
           }
           }
         }
}

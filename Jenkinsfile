pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage('build and push') {
            steps { 
                    sh"sudo docker build -t aymenchab/testing:1.0 ."
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh("sudo docker push aymenchab/testing:1.0")
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

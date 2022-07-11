pipeline {
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    agent any
    stages {
        stage('Sonar'){
            steps{
                sonar-scanner.bat -D"sonar.projectKey=PFE" -D"sonar.sources=." -D"sonar.host.url=http://172.29.4.125:9000" -D"sonar.login=df72de26ae67705f00562aadbfa1d05503c5e1ca"
                  }
        }
        stage('build and push') {
            steps { 
                    sh"sudo docker logout"
                    sh"sudo docker build -t aymenchab/images:v1.3 ."                  
                    withDockerRegistry([url: "", credentialsId: "dockerhub-id"]) {
                    sh("docker push aymenchab/images:v1.3")
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

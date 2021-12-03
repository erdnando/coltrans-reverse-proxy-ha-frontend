pipeline{
     
    agent any
    stages{
         
        stage('Get surce from GIT'){
            steps{
               // Get some code from a GitHub repository...
               //This path must exists on jenkins server
               sh 'rm -rf /opt/cicd/ha_config'
               sh 'git clone https://github.com/erdnando/coltrans-reverse-proxy-ha-frontend.git /opt/cicd/ha_config'
               echo 'Clon OK'
            }
         }
         
        stage('Build docker image'){
            steps{
                //build with included dockerfile 
                sh 'docker build -t erdnando/coltrans-reverse-proxy-ha-frontend:1.0 /opt/cicd/ha_config/'
                echo 'DockerBuild OK...'
            }
            
        }
        
         stage('Publish to DockerHub'){
            steps{
                 withDockerRegistry([ credentialsId: "github_erv", url: "" ]) {
                      sh 'docker push erdnando/coltrans-reverse-proxy-ha-frontend:1.0'
                    }
               
                } 
            }  
    }
    
}

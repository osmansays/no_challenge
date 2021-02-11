pipeline{
    agent any
    
    stages {
       
        stage("build"){
            steps{
                git "https://github.com/osmansays/no_challenge.git"
                dir("solution/first_part/") 
                    {
                    sh "chmod +X deploy.sh"
                    sh "docker build ../app/ -t osmansays/random:${BUILD_NUMBER}"
                    sh "docker build ../reverseproxy/ -t osmansays/rproxy:${BUILD_NUMBER}"
                    sh "VER=${BUILD_NUMBER} docker-compose up -d"
                    }
               

                echo 'building the application and deploying with Docker Compose'
            }
        }
        
        stage("Unit Testing"){
            steps{
                echo 'Running unit test cases on the application'
                sh "python solution/app/rand.test.py"
            }
        }
        stage("End to End Testing for Random App on Port 5000"){
            steps{
                echo 'testing the application on port 5000'
                sh "curl http://localhost:5000"
            }
        }

        stage("End to End Testing for Reverse Proxy functionality - http on port 80"){
            steps{
                echo 'testing the application on port 80'
                sh "curl http://localhost/random"
            }
        }
         stage("Ending the test and turn off testing environment"){
            steps{
                echo 'Running docker-compose down to turn off testing enviroment'
                dir("solution/first_part/") 
                    {
                    sh "docker-compose down"
                    }
            }
        }
        

        stage("deploy"){
            steps{
                echo 'deploying the applications on Kubernetes cluster using Kubectl'
                dir("solution/second_part/solutions-deployment-yml") 
                    {
                    sh 'kubectl apply -f .'
                    }
            }
        }
        
        stage('Check deployment status '){
            steps{
            sh '''
             uptodate_count=$(kubectl get deployments | grep random-solution-deployment | awk '{print $4}')
              if [ $uptodate_count -ge 2 ]; then
                     echo 'Deployment Working Correctly and pods are running as expected.. at least 2 pods are running out of 3'
                     exit 0
              else
              echo 'Pods failed to operate as expected , rolling back to older version'
              kubectl 
              exit 1
              fi

            '''
            }
        }
      
        stage('Anchore analyse') {  
    steps {  
     writeFile file: 'anchore_images', text: 'osmansays/random'  
     anchore name: 'anchore_images'  
    }  
    
        
        }
    }
}
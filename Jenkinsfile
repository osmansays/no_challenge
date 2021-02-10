pipeline{
    agent any
    
    stages {
       
        stage("build"){
            steps{
                git "https://github.com/osmansays/no_challenge.git"
                sh "./solution/first_part/deploy.sh"
                
                echo 'building the application'
            }
        }
        
        stage("Unit Testing"){
            steps{
                sh "python solution/app/rand.test.py"
                
                
                echo 'testing the application'
            }
        }
        stage("End to End Testing for Random App on Port 5000"){
            steps{
                sh "curl http://localhost:5000"
                
                echo 'testing the application on port 5000'
            }
        }

        stage("End to End Testing for Reverse Proxy functionality - http on port 80"){
            steps{
                sh "curl http://localhost"
                
                echo 'testing the application on port 80'
            }
        }
        
         
        }
        
        stage("deploy"){
            steps{
                echo 'deploying the application'
            }
        }
    }
    
}
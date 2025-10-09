pipeline{
    agent any
    
    stages{
        stage("build"){
             steps{
                script{
                    echo "build in progress"
            }
        }   
       }
    }
}
pipeline{
    agent{
      label "aws-agent"
    }
    
    stages{
        stage("build"){
             steps{
                script{
                    sh 'docker build -t MY-PROJECT4 '
        }
      }   
    }

    stages("push"){
         steps{
           script{
               withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'Password', usernameVariable: 'Username')]) {
               sh 'docker login --username $Username --password $Password'
               sh 'docker tag MY-PROJECT4 $Username/MY-PROJECT4'
               sh 'docker push $Username/MY-PROJECT4'
            }
        }
       }
    } 
    stage("deploy"){
        steps{
          script{
              withAWS(credentials: 'aws-ci', region: 'us-east-1') {
              sh 'aws eks update-kubeconfig --region us-east-1 --name my-eks-cluster '
              sh 'kubectl apply -f ./MY-PROJECT4/Deployment.yaml'
          }
        }
      }
    }
  }
}
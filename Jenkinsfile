pipeline {
environment {
registry = "https://hub.docker.com/repositories"
registryCredential = 'dockerid'
dockerImage = 'dineshrajwade/tomcat_new1'
}
agent any
stages {
stage('Cloning our Git') {
steps {
git 'https://github.com/dineshrajwade/devops.git'
}
}
stage('Building our image') {
steps{
script {
sh "rm -f webapp.war"
sh "cp /var/lib/jenkins/workspace/maven-git/webapp/target/webapp.war ." 
sh "ls -lrth"
sh "pwd"
docker.build dockerImage
}
}
}
stage('Push our image to docker hub') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
sh "docker push $dockerImage"

}
}
}
}
stage('Cleaning up') {
steps{
sh "docker rmi $dockerImage"
}
}
stage('Deploy to K8s')
  {
   steps{
   script{
   kubernetesDeploy(configs: "deploy.yaml", kubeconfigId: "kubernetes")
   kubernetesDeploy(configs: "service.yaml", kubeconfigId: "kubernetes")
   
       
   }
   }
   }
  }

}


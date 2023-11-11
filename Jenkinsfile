node {
  try {
    def app
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
    stage('Check docker build'){
        if(env.branch == 'develop')  {
            app = docker.build('satt294/my-home-repo')
        }
    }
    stage('Deploy'){
      if(env.BRANCH_NAME == 'release'){
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
      }
    }
  }
  catch (err) {
    throw err
  }
}
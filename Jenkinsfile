node {
  try {
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
            sh 'docker build -t found-on-highway -f Dockerfile --no-cache .'
        }
    }
    stage('Deploy'){
      if(env.BRANCH_NAME == 'release'){
        sh 'docker build --tag find-on-highway .'
        sh 'docker tag found-on-highway satt294/my-home-repo'
        sh 'docker push satt294/my-home-repo'
        sh 'docker rmi -f found-on-highway satt294/my-home-repo'
      }
    }
  }
  catch (err) {
    throw err
  }
}
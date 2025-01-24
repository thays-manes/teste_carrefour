#!/usr/bin/env groovy

//String var_folder


/*stage ('Clean env') {
		node ('LinuxSlaveDocker') {

      var_folder = 'nome_do_projeto'
			sh "rm -Rf ${var_folder}"
		}
}*/

node ('LinuxSlaveDocker') {
  try {

    stage('Docker build') {
        sh """
          docker build -t nome_do_projeto . -f Dockerfile
        """
    }
  
    stage('Test: QA API') {
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
        echo 'Execuntado os testes automatizados'
        sh """
           docker run --rm --network host \
           -v ${PWD}/workspace/nome_do_projeto/allure-results:/nome_do_projeto/allure-results \
           -i nome_do_projeto \
           cucumber
        """      
      }
    }
  }
  
  catch (e) {
   echo 'Failure: '                    
   currentBuild.result = 'FAILED'
  } finally {
  
  echo 'DONE'
  }
}

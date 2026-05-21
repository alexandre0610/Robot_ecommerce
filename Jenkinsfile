pipeline{
    agent any

   

    stages{

        stage('clean workspace'){
            steps{
                deleteDir()
            }
        }

        stage('global stage'){
            agent{
                docker{
                    image 'python:latest'
                    args '--user 1000:1000'
                }
            }

            stages{

                stage('install deps'){
                    steps{
                        sh 'pip --version'
                    }
                }
 

                stage('run user test'){
                    steps{  
                        script{
                            sh "echo hello"
                        }
                    }
                }
            }
        }
    }

    post{
        always{
            script{
                if(params.ALLURE){
                    try {
                        unstash 'allure-results'
                    } catch (e) {
                        echo "Pas de stash allure"
                    }

                    archiveArtifacts artifacts: 'allure-results/**', allowEmptyArchive: true

                    allure includeProperties: false,
                           jdk: '',
                           results: [[path: 'allure-results/']]
                }
            }
        }
    }
}
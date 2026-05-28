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
                // image docker  de python 
                docker{
                    image 'selenium/standalone-chrome'
                   args '--user 1000:1000 -e HOME=/tmp'
                }
            }
                
            stages{

                stage('install deps'){
                    steps{
                        sh 'pip --version'
                        sh 'pip install robotframework'
                        sh 'pip install robotframework-seleniumlibrary'
                        sh 'pip list'
                    }
                }
 

                stage('run user test'){
                    steps{  
                        script{

                            sh "python -m robot tests/e2e.robot"
                        }
                    }
                }
            }
        }
    }

    
}
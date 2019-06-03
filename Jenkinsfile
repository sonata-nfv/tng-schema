pipeline {
    agent any 
    stages {
         when{
            branch 'master'
        }
        stage ("Trigger tng-rep build") {
            steps {
                build job: '../tng-rep/master', wait: false
            }
        }
         when{
            branch 'master'
        }
        stage ("Trigger tng-sdk-package build") {
            steps {
                build job: '../tng-sdk-package-pipeline/master', wait: false
            }
        }
    }
}

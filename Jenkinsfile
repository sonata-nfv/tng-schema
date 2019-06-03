pipeline {
    agent any 
    stages {
        stage ("Trigger tng-rep build") {
            when{
                branch 'master'
            }
            steps {
                build job: '../tng-rep/master', wait: false
            }
        }
        stage ("Trigger tng-sdk-package build") {
            when{
                branch 'master'
            }
            steps {
                build job: '../tng-sdk-package-pipeline/master', wait: false
            }
        }
    }
}

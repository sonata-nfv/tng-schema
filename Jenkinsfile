pipeline {
    agent any 
    stages {
        stage ("Trigger tng-rep build") {
            steps {
                build job: '../tng-rep/master', parameters: [wait: False]
            }
        }
        stage ("Trigger tng-sdk-package build") {
            steps {
                build job: '../tng-sdk-package-pipeline/master', parameters: [wait: False]
            }
        }
    }
}

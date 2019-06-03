pipeline {
    agent any 
    stages {
        stage ("Trigger tng-rep build") {
            steps {
                build '../tng-rep/master'
                wait false
            }
        }
        stage ("Trigger tng-sdk-package build") {
            steps {
                build '../tng-sdk-package/master'
                wait false
            }
        }
    }
}

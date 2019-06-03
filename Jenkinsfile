pipeline {				//indicate the job is written in Declarative Pipeline
    agent any				//agent specifies where the pipeline will execute. 
    stages {
        stage ("Trigger tng-rep build") {		//an arbitrary stage name
            steps {
                build '../tng-rep/master'	//this is where we specify which job to invoke.
            }
        }
        stage ("Trigger tng-sdk-package build") {		//an arbitrary stage name
            steps {
                build '../tng-sdk-package/master'	//this is where we specify which job to invoke.
            }
        }
    }
}

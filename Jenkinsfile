pipeline {
    agent any
    stages {
        stage('Creat project') {
            steps {
                sh 'zsh ./Scripts/makeRootProject.sh'
                sh 'which tuist'
            }
        }
    }
}
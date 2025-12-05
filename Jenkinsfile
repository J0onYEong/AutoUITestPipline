pipeline {
    agent { label 'macos' }
    stages {
        stage('Creat project') {
            steps {
                sh './Scripts/makeRootProject.sh'
            }
        }
    }
}
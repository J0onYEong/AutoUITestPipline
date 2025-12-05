pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world from scm!'
                echo "매개변수 테스트: ${params.Greeting}"
            }
        }
    }
}
pipeline {
    agent any

    environment {
        DEST_DEVICE = "iPhone 17 Pro"
        DEST_OS = "26.0"
        DEBUG_BUILD_SCHEME = "Junios"
        TEST_BUILD_SCHEME = "Junios"
        GITHUB_TOKEN = credentials('github-token')
    }

    stages {
        stage('Creat project') {
            steps {
                sh 'zsh ./Scripts/makeRootProject.sh'
            }
        }

        stage('Build project') {
            steps {
                githubNotify context: 'Build Application', status: 'PENDING'
                sh '''
                echo "Running build for Pull Request #${CHANGE_ID}"

                cd Junios
                
                xcodebuild \
                    -workspace Junios.xcworkspace \
                    -scheme ${DEBUG_BUILD_SCHEME} \
                    -configuration Debug \
                    -sdk iphonesimulator \
                    -destination "platform=iOS Simulator,name=${DEST_DEVICE},OS=${DEST_OS}" \
                    clean build
                '''
                
                sh '''
                curl -X POST \
                    -H "Authorization: token $GITHUB_TOKEN" \
                    -H "Accept: application/vnd.github.v3+json" \
                    https://api.github.com/repos/J0onYEong/AutoUITestPipline/issues/${CHANGE_ID}/comments \
                    -d '{ "body": "빌드가 완료되었습니다! 🎉" }'
                '''

                githubNotify context: 'Build Application', status: 'SUCCESS', description: '빌드 성공'
            }
            post {
                failure {
                    githubNotify context: 'Build Application', status: 'FAILURE', description: '빌드 실패'
                    githubNotify context: 'Unit Tests', status: 'ERROR', description: '빌드 실패로 테스트 미실행'
                }
            }
        }

        stage('Test project') {
            steps {
                githubNotify context: 'Unit Tests', status: 'PENDING', description: '빌드 성공'
                sh '''
                echo "Running UI Tests for Pull Request #${CHANGE_ID}"

                cd Junios

                xcodebuild \
                    -workspace Junios.xcworkspace \
                    -scheme ${TEST_BUILD_SCHEME} \
                    -configuration Debug \
                    -sdk iphonesimulator \
                    -destination "platform=iOS Simulator,name=${DEST_DEVICE},OS=${DEST_OS}" \
                    test \
                    -resultBundlePath TestResults_${BUILD_NUMBER}.xcresult
                '''
                githubNotify context: 'Unit Tests', status: 'SUCCESS', description: '단위 테스트 통과'
            }
            post {
                failure {
                    githubNotify context: 'Unit Tests', status: 'FAILURE', description: '테스트 실패'
                }
            }
        }
    }
}
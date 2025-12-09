pipeline {
    agent any

    environment {
        DEST_DEVICE = "iPhone 17 Pro"
        DEST_OS = "26.0"
        WORKSPACE_PATH = "Junios/Junios.xcworkspace"
        DEBUG_BUILD_SCHEME = "Junios"
        TEST_BUILD_SCHEME = "Junios"
        GITHUB_TOKEN = credentials('github-access-token')
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
                
                xcodebuild \
                    -workspace ${WORKSPACE_PATH} \
                    -scheme ${DEBUG_BUILD_SCHEME} \
                    -configuration Debug \
                    -sdk iphonesimulator \
                    -destination "platform=iOS Simulator,name=${DEST_DEVICE},OS=${DEST_OS}" \
                    clean build
                '''
                
                sh '''
                
                zsh ./Scripts/createUniquePRComment.sh \
                    "Build Result" \
                    "빌드를 성공적으로 완료했습니다! 🎉" \
                    "${GITHUB_TOKEN}" \
                    "${CHANGE_ID}"
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

                zsh ./Scripts/testAndReport.sh \
                    "${WORKSPACE_PATH}" \
                    "${TEST_BUILD_SCHEME}" \
                    "${DEST_DEVICE}" \
                    "${DEST_OS}" \
                    "${GITHUB_TOKEN}" \
                    "${CHANGE_ID}"
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
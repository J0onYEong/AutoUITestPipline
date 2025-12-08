pipeline {
    agent any

    environment {
        DEST_DEVICE = "iPhone 17 Pro"
        DEST_OS = "26.0"
        DEBUG_BUILD_SCHEME = "Junios"
        TEST_BUILD_SCHEME = "Junios"
    }

    stages {
        stage('Creat project') {
            steps {
                sh 'zsh ./Scripts/makeRootProject.sh'
            }
        }

        stage('Build project') {
            steps {
                withChecks(name: "Build application") {
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
                    publishChecks(conclusion: 'SUCCESS', summary: '빌드 성공, title: 'Build Succeeded')
                }
            }
        }

        stage('Test project') {
            steps {
                withChecks(name: "Unit Tests") {
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
                    publishChecks(conclusion: 'SUCCESS', summary: '단위 테스트 성공', title: 'Unit test Succeeded')
                }
            }
        }
    }
}
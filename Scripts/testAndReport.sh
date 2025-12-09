#!/bin/zsh

set -e

export PATH="/opt/homebrew/bin:$PATH"

WORKSPACE_PATH=$1
TEST_SCHEME=$2
DEST_DEVICE=$3
DEST_OS=$4
GITHUB_TOKEN=$5
CHANGE_ID=$6

RESULT_BUNDLE_PATH="$(pwd)/TestResults.xcresult"

# 결과 번들 정리
cleanup() {
    rm -rf "$RESULT_BUNDLE_PATH"
}   
trap cleanup EXIT

cd Junios

# 테스트 실행
xcodebuild \
    -workspace ${WORKSPACE_PATH} \
    -scheme ${TEST_SCHEME} \
    -configuration Debug \
    -sdk iphonesimulator \
    -destination "platform=iOS Simulator,name=${DEST_DEVICE},OS=${DEST_OS}" \
    test \
    -enableCodeCoverage YES \
    -resultBundlePath "$RESULT_BUNDLE_PATH"

# 리포트 생성
REPORT=$(xcresultparser "$RESULT_BUNDLE_PATH" -o md -p '.' -c )

# PR 코멘트 작성
./Scripts/createUniquePRComment.sh \
    "Test Result" \
    "$REPORT" \
    "${GITHUB_TOKEN}" \
    "${CHANGE_ID}" 

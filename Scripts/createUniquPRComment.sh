#!/bin/zsh

UNIQUE_TITLE=$1
COMMENT_BODY=$2
GIT_TOKEN=$3
PR_NUMBER=$4

BASE_URL="https://api.github.com/repos/J0onYEong/AutoUITestPipline"

# 기존 코멘트 획득
RES_COMMENTS=$(curl -L \
  -X GET \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GIT_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  ${BASE_URL}/issues/comments)

# 기존 코멘트 아이디 도출
WILL_DELETE_COMMENT_IDS=$(
  printf '%s' "$RES_COMMENTS" | jq '.[] | select(.body | contains("'"## ${UNIQUE_TITLE}"'")) | .id'
)

# 기존 코멘트 삭제
echo "$WILL_DELETE_COMMENT_IDS" | while read -r COMMENT_ID; do
  curl -L \
    -X DELETE \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GIT_TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    ${BASE_URL}/issues/comments/${COMMENT_ID}
done

# 새로운 코멘트 생성
NEW_BODY="## ${UNIQUE_TITLE}\\n${COMMENT_BODY}"

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GIT_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  ${BASE_URL}/issues/${PR_NUMBER}/comments \
  -d "{\"body\": \"${NEW_BODY}\"}" > /dev/null 2>&1
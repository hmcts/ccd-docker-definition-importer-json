#!/bin/sh
set -e

[ "_${GITHUB_CREDS_MOUNT}${GITHUB_TOKEN}" = "_" ] && echo "No GitHub token to load from GITHUB_CREDS_MOUNT or GITHUB_TOKEN. Script terminated." && exit 0

if [ "_${GITHUB_CREDS_MOUNT}" != "_" ] && [ -f ${GITHUB_CREDS_MOUNT}/hmcts-github-apikey ]; then
  ACCESS_TOKEN=$(cat ${GITHUB_CREDS_MOUNT}/hmcts-github-apikey)
elif [ "_${GITHUB_TOKEN}" != "_" ]; then
  ACCESS_TOKEN=$GITHUB_TOKEN
fi

if [ "_${CCD_DEF_GIT}" != "_" ]; then
  git clone https://${ACCESS_TOKEN}@${CCD_DEF_GIT}
fi

yarn json2xlsx -D ${CCD_DEF_DIR} -o /${CCD_DEF_FILENAME}

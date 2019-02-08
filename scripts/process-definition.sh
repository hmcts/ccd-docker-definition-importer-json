#!/bin/sh
set -e

if [ "_${CCD_DEF_GIT}" != "_" ]; then
  git clone https://${GITHUB_TOKEN}@${CCD_DEF_GIT}
fi

yarn json2xlsx -D ${CCD_DEF_DIR} -o /${CCD_DEF_FILENAME}

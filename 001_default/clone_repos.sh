#!/bin/bash


SPIDERIMENG_NG__GIT_URL="https://github.com/vitlabuda/spideriment-ng.git"
SPIDERIMENT_NG_SEARCH__GIT_URL="https://github.com/vitlabuda/spideriment-ng-search.git"


git clone "${SPIDERIMENG_NG__GIT_URL}" || exit 1
git clone "${SPIDERIMENT_NG_SEARCH__GIT_URL}" || exit 1

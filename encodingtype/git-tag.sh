#!/usr/bin/env bash

# This script tag a PR with the earliest version that contains it
# to avoid manual handling and time taking.

# Sample usage:
#		$ git-tag <PullRequestNumber> <Commit Sha>

set -euo pipefail

# 1. Create your github PERSONAL ACCESS TOKEN at https://github.com/settings/tokens

# 2. Enter these fields
# GH_TOKEN_PATH=          # path to your PERSONAL ACCESS TOKEN
# GH_TOKEN_PATH="/Users/admin/Desktop/git-token"


# PRNUM=$1
# COMMITSHA=$2

# GIT_VERSION=$(git tag --contains ${COMMITSHA})

# COMMENT="""
# Automated comment to show tag version from the commits.
# **********************
# - Commit 08d4a089ffe33676a0fd421e024e244cbd1957fa
# - tag version: ${GIT_VERSION}
# **********************
# """

# gh pr comment 1 --body "${COMMENT}"

# LABEL="earliest-release-v${GIT_VERSION}"
# # First we need to create the label
# if gh api --silent repos/alan-mas/stringer_test/labels -f name=${LABEL} -f color="000000"
# then
# 	echo "New Tag ${LABEL} created"
# 	gh pr edit ${PRNUM} --add-label ${LABEL}
# 	echo "New Tag ${LABEL} added to PR: ${PRNUM}"
# else 
# 	# In case label is already created, it will only tag de PR.
# 	echo "Tag ${LABEL} already exists"
# 	gh pr edit ${PRNUM} --add-label ${LABEL}
# 	echo "Tag added to PR: ${PRNUM}"
# fi

# GET /repos/:owner/:repo/pulls/:pull_number/commits
# curl \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/repos/alan-mas/stringer_test/pulls/1/commits


# Based on GITHUB API documentation:
# Every pull request is an issue, but not every issue is a pull request.
# For this reason, "shared" actions for both features, like manipulating assignees, labels
# and milestones, are provided within the Issues API.
# That is why we are using issues path instead of pull request in the https link
# https://docs.github.com/en/rest/reference/pulls#update-a-pull-reques

# # First we need to create the label.
# if curl \
# 		-s -f -X POST https://api.github.com/repos/alan-mas/stringer_test/labels \
# 		-H "Authorization: token $(cat ${GH_TOKEN_PATH})" -d '{"name":"'"${LABEL}"'","color":"000000"}'
# then
# 	echo "New Tag ${LABEL} created"
# 	curl -X POST https://api.github.com/repos/alan-mas/stringer_test/issues/${PRNUM}/labels \
# 			 -H "Authorization: token $(cat ${GH_TOKEN_PATH})" \
# 			 -d '["'"${LABEL}"'"]'
# 	echo "New Tag ${LABEL} added to PR: ${PRNUM}"
# 	else 
# 	# In case label is already created, it will only tag de PR.
# 	echo "Tag ${LABEL} already exists"
# 		curl -X POST https://api.github.com/repos/alan-mas/stringer_test/issues/${PRNUM}/labels \
# 			   -H "Authorization: token $(cat ${GH_TOKEN_PATH})" \
# 			   -d '["'"${LABEL}"'"]'
# 	echo "Tag added to PR: ${PRNUM}"
# fi



# curl \
# 		-f -X POST https://api.github.com/repos/alan-mas/stringer_test/labels \
# 		-H "Accept: application/vnd.github.v3+json" -d '{"name":"alan-prueba-API","color":"000000"}'



# curl -f -X POST https://api.github.com/repos/alan-mas/stringer_test/pulls/1/ \
# 		"Authorization: token $(cat /Users/admin/Desktop/git-token)" \
# 		-d '{"labels":[{"name":"alan-prueba-API"}]}'




# curl -X POST https://api.github.com/repos/alan-mas/stringer_test/issues/1/labels \
# 		-H "Authorization: token $(cat /Users/admin/Desktop/git-token)" \
# 		-d '["alan-prueba-API"]'




# curl -X GET https://api.github.com/repos/alan-mas/stringer_test/pulls/1

#     "labels": [
#       {
#         "id": 208045946,
#         "node_id": "MDU6TGFiZWwyMDgwNDU5NDY=",
#         "url": "https://api.github.com/repos/octocat/Hello-World/labels/bug",
#         "name": "bug",
#         "description": "Something isn't working",
#         "color": "f29513",
#         "default": true
#       }
#     ]





# "Get all the commits in a list"
LOG_LIST=($(git log --reflog --pretty=format:"%H"))
echo ${LOG_LIST[@]}


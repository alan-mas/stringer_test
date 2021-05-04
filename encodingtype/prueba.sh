#!/usr/bin/env bash

# This command is used to comment a PR with the earliest version that contains it
# to avoid manual handling and time taking.

set -euo pipefail

# Do not use plumbing commands, like git diff-index, in this target. Our build
# process modifies files quickly enough that plumbing commands report false
# positives on filesystems with only one second of resolution as a performance
# optimization. Porcelain commands, like git diff, exist to detect and remove
# these false positives.
#
# For details, see the "Possible timestamp problems with diff-files?" thread on
# the Git mailing list (http://marc.info/?l=git&m=131687596307197).


# COMMITS=$1

read -a arr

for elem in ${arr[@]}
do 
  echo $elem
done



# Declare an array of string with type
# declare -a OutCommits=(${COMMITS})

# echo ${OutCommits}

# # Iterate the string array using for loop
# for val in ${StringArray[@]}; do
#    echo $val
# done


# GIT_VERSION=


# GIT_BUILD_TYPE="development"
# GIT_COMMIT=$(git rev-parse HEAD)
# GIT_TAG=$(git describe --tags --dirty --match=v[0-9]* 2> /dev/null || git rev-parse --short HEAD;)
# GIT_UTCTIME=$(date -u '+%Y/%m/%d %H:%M:%S')
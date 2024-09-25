#!/bin/sh
set -e

function check_uncommitted_changes() {
  if [[ -z "$(git status --porcelain $STATUS_ARGS $PATHSPEC)" ]];
  then
    echo "0"
    return 0
  else
    echo "1"
    return 1
  fi
}

function check_uncommitted_changes_status() {
  status=$(git status --porcelain $STATUS_ARGS $PATHSPEC)
  if [ -n "$status" ]; then
    status="${status//'%'/'%25'}"
    status="${status//$'\n'/'%0A'}"
    status="${status//$'\r'/'%0D'}"
    echo "$status"
    exit 1
  else
    echo ""
    exit 0
  fi
}

git config --global --add safe.directory /github/workspace

changed=$(check_uncommitted_changes)
changes=$(check_uncommitted_changes_status)

echo "changed=$changed" >> $GITHUB_OUTPUT
echo "changes=$changes" >> $GITHUB_OUTPUT


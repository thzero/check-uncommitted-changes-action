#!/bin/sh
set -e

function check_uncommitted_changes() {
  if [ -n "$(git status --porcelain)" ]; then
    echo "1"
  else
    echo "0"
  fi
}

echo ::set-output name=changes::$(check_uncommitted_changes)

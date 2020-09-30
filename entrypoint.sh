#!/bin/bash
set -e

function check_uncommitted_changes() {
  if [ -n "$(git status --porcelain)" ]; then
    echo "1"
  else
    echo "0"
  fi
}

echo ::set-output name=changed::$(check_uncommitted_changes)

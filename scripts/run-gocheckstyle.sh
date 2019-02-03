#!/usr/bin/env bash
set -v
if [ "${CIRCLE_BRANCH}" != "master" ]; then
  # Circle-CI
  #
  sudo apt-get update && sudo apt-get install rubygems
  sudo gem install --no-document checkstyle_filter-git saddler saddler-reporter-github


  echo "********************"
  echo "* select reporter  *"
  echo "********************"

  if [ -z "${CI_PULL_REQUEST}" ]; then
      # when not pull request
      REPORTER=Saddler::Reporter::Github::CommitReviewComment
  else
      REPORTER=Saddler::Reporter::Github::PullRequestReviewComment
  fi

echo "********************"
echo "* checkstyle       *"
echo "********************"
cat gostyle.xml \
    | checkstyle_filter-git diff origin/master \
    | saddler report --require saddler/reporter/github --reporter $REPORTER
fi

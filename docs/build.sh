#!/bin/bash

# Script to build Read the Docs documentation

# Install Dependencies
apt-get update
apt-get -y install git rsync python3-sphinx python3-sphinx-rtd-theme

pwd
ls -lah

# Build the documentation
make -C docs clean
make -C docs html

# Update GitHub pages
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

docroot=$(mktemp -d)
rsync -av "docs/_build/html" "${docroot}/"
pushd "${docroot}" || exit

git init
git remote add deploy "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git checkout -b gh-pages

touch .nojekyll

git add .
git commit -am "Updating docs for commit ${GITHUB_SHA}"
git push deploy gh-pages --force

popd || exit

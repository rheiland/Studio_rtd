#!/bin/bash

# Script to build Read the Docs documentation

# Install Dependencies
apt-get update
apt-get -y install git rsync python3-sphinx python3-sphinx-rtd-theme python3-pip

python3 -m pip install --upgrade

# Build the documentation
## Clean up old assets
make -C docs clean

## Build HTML
sphinx-build docs/source docs/build/html/

# Update GitHub Pages

## Sets the user to whoever pushed a commit
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

## Make a temp directory for GitHub Pages
docroot=$(mktemp -d)

## Copy HTML assets into docroot
rsync -av "docs/build/html" "${docroot}/"

pushd "${docroot}" || exit

git init
git remote add deploy "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git checkout -b gh-pages

touch .nojekyll

git add .
git commit -am "Updating docs for commit ${GITHUB_SHA}"
git push deploy gh-pages --force

popd || exit

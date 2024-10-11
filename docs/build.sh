# Install dependencies
apt-get update
apt-get -y install git rsync python3-sphinx python3-sphinx-rtd-theme

pwd
ls -lah
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)

make -C docs clean
make -C docs html

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

docroot=`mktemp -d`
rsync -av "docs/_build/html/" "${docroot}/"

pushd "${docroot}"

git init
git remote add deploy "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
gh checkout -b gh-pages

touch .nojekyll

git add .
git commit -am "Update docs"

git push deploy gh-pages --force

popd

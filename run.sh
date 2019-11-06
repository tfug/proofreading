#!/bin/bash

# Check the number of arguments
if [ $# -ne 2 ]; then
  echo "Error: Invalid arguments"
  echo "Usage: ./bin/run.sh <repository name> <branch name>"
  exit 1
fi

GITHUB_REPOSITORY=${1}
GITHUB_REPOSITORY_URL="https://github.com/${GITHUB_REPOSITORY}"
BRANCH=${2}

echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
echo "GITHUB_REPOSITORY_URL: ${GITHUB_REPOSITORY_URL}"
echo "BRANCH: ${BRANCH}"

TEMP_DIR="ghrepos"

# Remove temporary directory
rm -rf ${TEMP_DIR}
mkdir ${TEMP_DIR}

# Clone GitHub repository
git clone -b ${BRANCH} ${GITHUB_REPOSITORY_URL} ${TEMP_DIR}/${GITHUB_REPOSITORY}

# Convert all notebooks to markdowns
notebooks=`find ${TEMP_DIR}/${GITHUB_REPOSITORY}/site/ja -type f | grep .ipynb`
for notebook in ${notebooks}; do
  jupyter nbconvert --to markdown ${notebook}
done

# Apply RedPen to all markdowns
files=`find ${TEMP_DIR}/${GITHUB_REPOSITORY}/site/ja -type f | grep .md`
for file in ${files}; do
  echo "[${file}]"
  redpen --result-format plain2 ${file}
done

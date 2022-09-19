#!/bin/bash

set -ev

TAG=`git describe --tags --abbrev=0`
NEW_TAG=`npx semver -i minor $TAG`
TARGET_BRANCH="gh-pages"

git checkout -b $TARGET_BRANCH

cp ./node_modules/mapbox-gl/dist/mapbox-gl.js ./
cp ./node_modules/mapbox-gl/dist/mapbox-gl-dev.js ./
cp ./node_modules/mapbox-gl/dist/mapbox-gl.css ./

cp ./build/built-style-debug.json ./style-debug.json
cp ./build/built-style.json ./style.json
cp ./build/style-omt.json ./style-omt.json
cp ./build/sprite.json ./sprite.json
cp ./build/sprite.png ./sprite.png
cp ./build/sprite@2x.json ./sprite@2x.json
cp ./build/sprite@2x.png ./sprite@2x.png

cp ./build/font/iconfont* ./

git add mapbox-gl.js mapbox-gl-dev.js mapbox-gl.css
git add style-debug.json style.json style-omt.json
git add sprite*
git add iconfont*

git commit --message "gh-pages precommit $NEW_TAG"
git push origin $TARGET_BRANCH -f

# add screenshots
mkdir preview
cd preview
docker pull qwantresearch/thumbnail-gl
docker run -v $(pwd):/data qwantresearch/thumbnail-gl "https://qwant.github.io/qwant-basic-gl-style/style.json" "-x 2.3061 -y 48.8811 -z 15 -w 800 -h 600 -r 1"
cd ..
git add preview/*

mv ghpages-readme README.md
git add README.md

# commit again with screenshots
git commit --message "gh-pages update $NEW_TAG"
git push origin $TARGET_BRANCH

git checkout master
git tag "v$NEW_TAG"
git push --tags origin master

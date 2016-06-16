#!/bin/bash

BASE=$CI_PROJECT_DIR
DISTRO="centos5 centos6 centos7 precise trusty xenial wheezy jessie stretch"
VERSION="193 200 219 225 231 latest"
OUT=.gitlab-ci.yml
rm -f $OUT
cat > $OUT  <<EOF
image: docker:latest

services:
 - docker:dind

stages:
 - build
 - test
 - deploy

before_script:
 - docker info
EOF

for x in $DISTRO
do
    echo $x
    for y in $VERSION
    do
        echo "$x ruby $y"
        echo "
build-$x-$y:
 stage: test
 script:
  - docker build -t images-$x-ruby$y \$CI_PROJECT_DIR/$x-ruby$y
  - docker tag images-$x-ruby$y udienz/images:$x-ruby$y
  - docker login -u=\"\$DOCKERUSER\" -p=\"\$DOCKERPASS\"
  - docker push udienz/images:$x-ruby$y" >> $OUT
    done
done

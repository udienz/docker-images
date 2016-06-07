#!/bin/bash
# this is for debian based

DISTRO="centos5 centos6 centos7"
VERSION="193 200 219 225 231"
BASE=$HOME/git/docker/images

for a in $DISTRO
do
    for b in $VERSION
    do
        cat > $BASE/$a-ruby$b/Dockerfile <<EOF
#Created at $(date -u)
FROM udienz/buildpack:$a
MAINTAINER Mahyuddin Susanto <udienz@gmail.com>

`cat $BASE/tmpl/centos-base.tmpl`

`cat $BASE/tmpl/centos-ruby-$b.tmpl`
EOF
done
done

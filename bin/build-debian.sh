#!/bin/bash
# this is for debian based

DISTRO="precise trusty xenial wheezy jessie stretch"
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

`cat $BASE/tmpl/debian-base.tmpl`

`cat $BASE/tmpl/debian-ruby-$b.tmpl`
EOF
done
done

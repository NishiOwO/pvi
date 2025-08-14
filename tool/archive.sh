#!/bin/sh
make mrproper

rm -f *.tar.gz

VERSION=`grep VERSION include/common.h | egrep -o '".+"$' | sed 's/"//g'`

rm -rf /tmp/pvi-*
cp -rf . /tmp/pvi-$VERSION

OLD=`pwd`

cd /tmp

tar czvf pvi-$VERSION.tar.gz pvi-$VERSION

rm -rf pvi-$VERSION

mv pvi-$VERSION.tar.gz $OLD/

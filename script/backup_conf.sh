#!/bin/sh

cd ~

if git commit -am "automatic backup" ; then
   git push
fi


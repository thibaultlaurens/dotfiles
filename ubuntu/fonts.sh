#!/usr/bin/env bash

wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip

if [ ! -d "$HOME/.fonts" ] ; then
    mkdir "$HOME/.fonts"
fi

unzip 1.050R-it.zip 
cp -n source-code-pro-*-it/OTF/*.otf "$HOME/.fonts/"

rm -rf source-code-pro* 
rm 1.050R-it.zip

fc-cache -f -v

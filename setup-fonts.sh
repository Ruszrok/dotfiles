#!/bin/bash
source ./setup-utility.sh

progress "setup powerline fonts"
fontDir=~/.local/share/fonts
mkdir -p $fontDir
if [ ! -f $fontDir/PowerlineSymbols.otf ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf -qP $fontDir

    fc-cache -f -v
fi

fontConfigDir=~/.config/fontconfig/fonts.conf
mkdir -p $fontConfigDir

if [ ! -f $fontConfigDir/10-powerline-symbols.conf ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf -qP $fontConfigDir
fi

pass "setup powerline fonts"

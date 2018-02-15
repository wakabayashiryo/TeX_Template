#!/bin/sh

PLATEX="platex"
DVI2PDF="dvipdfmx"
RM="rm -r -f"

INFODIR="./Info"
DOCDIR="./Doc"
SRCDIR="./Src"

if [ "$1" = "clean" ]; then
    echo clean
    $RM $INFODIR $DOCDIR
else
    test -n "$1" || exit 1 # if theer is no arguments,will exit
    
    mkdir -p $INFODIR
    mkdir -p $DOCDIR
    
    CHARCODE='nkf -g *.tex'   
    case $CHARCODE in # nkf が返す文字コードにあわせる
        UTF-8) KANJI="-kanji=utf8";;
        EUC-JP) KANJI="-kanji=euc";;
        Shift-JIS) KANJI="kanji=sjis";;
        ISO-2022-JP) KANJI="-kanji=jis";;
    esac

    cd $SRCDIR
    $PLATEX -synctex=1 -output-directory="../$INFODIR" $KANJI $(basename $1)
    cd ../

    $DVI2PDF -o $DOCDIR/output.pdf $INFODIR/*.dvi  
      
    evince $DOCDIR/*.pdf&
fi









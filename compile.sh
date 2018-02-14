#
# File-Name: Makefile
#
# Created in: 2018/2/13
# Author: Ryo Wakabayashi
#

UPLATEX="uplatex"
RM="rm -f -r"
DVI2PDF="dvipdfmx" 

INFODIR="./Info"
DOCDIR="./Doc"
 
CHARCODE='nkf -g *.tex'   
case $CHARCODE in # nkf が返す文字コードにあわせる
    UTF-8) KANJI="-kanji=utf8";;
    EUC-JP) KANJI="-kanji=euc";;
    Shift-JIS) KANJI="kanji=sjis";;
    ISO-2022-JP) KANJI="-kanji=jis";;
esac


mkdir -p $DOCDIR
mkdir -p $INFODIR

cd $INFODIR
$UPLATEX $KANJI ../*.tex
cd ../

${DVI2PDF} -o $DOCDIR/output.pdf $INFODIR/*.dvi 

evince $DOCDIR/*.pdf&


# $RM $INFODIR $DOCDIR



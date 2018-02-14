#! /bin/sh

sudo apt-get -y remove texlive* 											# 本体 

sudo apt-get -y remove xdvik-ja 										# プレビューを見るのに必要 

sudo apt-get -y remove dvipsk-ja        # DVI から PostScript への変換用 

sudo apt-get -y remove gv               # Ghostscript 形式の図を取り込んだ文書の作成用 

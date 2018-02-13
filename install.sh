#! /bin/sh

echo "installing git..." 
sudo apt-get install git

echo "installing texlive..."
sudo apt-get -y install texlive 											# 本体 

echo "installing texlive-lang-cjk..."
sudo apt-get -y install texlive-lang-cjk # 日本語版 (UTF8 対応) 

echo "installing txdvik-ja..."
sudo apt-get -y install xdvik-ja 										# プレビューを見るのに必要 

echo "installing dvipsk-ja..."
sudo apt-get -y install dvipsk-ja        # DVI から PostScript への変換用 

echo "installing gv..."
sudo apt-get -y install gv               # Ghostscript 形式の図を取り込んだ文書の作成用 

echo "installing fonts for texlive..."
sudo apt-get -y install texlive-fonts-recommended texlive-fonts-extra 


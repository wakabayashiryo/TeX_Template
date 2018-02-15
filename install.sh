#! /bin/sh

sudo apt-get install nkf

sudo apt-get -y install texlive-full latex-cjk-japanese

# sudo apt-get -y install texlive-lang-cjk # 日本語版 (UTF8 対応) 

# sudo apt-get -y install texlive-fonts-recommended texlive-fonts-extra 


sudo apt-get -y install xdvik-ja 										# プレビューを見るのに必要 

sudo apt-get -y install dvipsk-ja        # DVI から PostScript への変換用 

sudo apt-get -y install gv               # Ghostscript 形式の図を取り込んだ文書の作成用 

sudo chmod +x compile.sh
sudo chmod +x uninstall.sh



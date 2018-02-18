#
#  File-Name: Makefile
#
#  Created in: 2018/2/15
#  Author: Wakabayashi Ryo

PLATEX	:=	platex
DVI2PDF	:=	dvipdfmx
RM		:=	rm -r -f

INFODIR	:=	./Info
DOCDIR	:=	./Doc
SRCDIR	:=	./Src

.PHONY: all clean install uninstall  

all: compile $(DOCDIR)/%.pdf viewpdf 

compile:
    -@mkdir -p $(INFODIR)
    -@mkdir -p $(DOCDIR)

    CHARCODE:=nkf -g $1   
    case $(CHARCODE) in # nkf が返す文字コードにあわせる
        UTF-8) 			KANJI := -kanji=utf8;;
        EUC-JP) 		KANJI := -kanji=euc;;
        Shift-JIS) 		KANJI := kanji=sjis;;
        ISO-2022-JP) 	KANJI := -kanji=jis;;
    esac

    test -n "$1" || exit 1 # if theer is no arguments,will exit
    
    cd $(SRCDIR)
    $(PLATEX) -synctex=1 -output-directory="../$(INFODIR)" $(KANJI $(basename $1))
    cd ../

dvipdf: $(DOCDIR)/%.pdf

# $(DOCDIR)/%.pdf: $(INFODIR)/%.dvi
#     $(DVI2PDF) -o $@ $^
      
# viewpdf: 
#     evince $(DOCDIR)/%.pdf&

clean:
	$(RM) $(INFODIR) $(DOCDIR)

install:
	sudo apt-get install nkf

	sudo apt-get -y install texlive-full latex-cjk-japanese

uninstal:
	sudo apt-get remove nkf

	sudo apt-get remove texlive-full latex-cjk-japanese


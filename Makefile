#
#  File-Name: Makefile
#
#  Created in: 2018/2/15
#  Author: Wakabayashi Ryo
#  Editor: Emacs

PLATEX	:= platex
DVI2PDF	:= dvipdfmx
VIEWER  := evince
RM	:= rm -r -f

INFODIR	:= ./Info
DOCDIR	:= ./Doc
SRCDIR	:= ./Src

FILE  	:= hoge
DVIS    := $(wildcard $(INFODIR)/*.dvi)
CHARCODE:= $(shell nkf -g $(FILE))

TEXFLAG := -synctex=1 -output-directory=../$(INFODIR)

.PHONY: all clean install uninstall 

all: checkTeX $(INFODIR)/% $(DOCDIR)/%.pdf viewpdf

checkTeX:
# Check file path argument
#	if[! -e $(FILE)];then
#		echo 'input regal filename';
#		$(error Input make FILE=<filename>)
#	fi

# get character code from tex document
#"case" of shell command is not supported

ifeq ($(CHARCODE),UTF-8)     
TEXFLAG += -kanji=utf8
endif
ifeq ($(CHARCODE),EUC-JP)
TEXFLAG += -kanji=euc
endif
ifeq ($(CHARCODE),Shift-JIS)
TEXFLAG += kanji=sjis
endif
ifeq ($(CHARCODE),ISO-2022-JP)
TEXFLAG += -kanji=jis
endif

$(INFODIR)/%:
	-@mkdir -p $(INFODIR)
	-@mkdir -p $(DOCDIR)

	-@cd $(SRCDIR);\
	$(PLATEX) $(TEXFLAG) $(notdir $(FILE))

$(DOCDIR)/%.pdf: $(DVIS)
	$(DVI2PDF) -o $@ $^

viewpdf:
	@$(VIEWER) $(DOCDIR)/$(notdir $(FILE)).pdf&

clean:
	$(RM) $(INFODIR) $(DOCDIR)

install:
	sudo apt-get install nkf

	sudo apt-get -y install texlive-full latex-cjk-japanese

uninstal:
	sudo apt-get remove nkf

	sudo apt-get remove texlive-full latex-cjk-japanese


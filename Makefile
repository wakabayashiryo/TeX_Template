#
#  File-Name: Makefile
#
#  Created in: 2018/2/15
#  Author: Wakabayashi Ryo
#  Editor: Emacs

#command of LiveTex compiler
PLATEX	:= platex
#conver to pdf from .dvi
DVI2PDF	:= dvipdfmx
#pdf viewer
VIEWER  := evince
#remove command
RM	:= rm -r -f

INFODIR	:= ./Info
DOCDIR	:= ./Doc
SRCDIR	:= ./Src

FILE 	?= hoge.tex		#if undefined,hege.txt is substituted

DVIS    := $(INFODIR)/$(notdir $(basename $(FILE))).dvi
CHARCODE:= nkf -g $(FILE)	#Get Charactor code

TEXFLAG := -synctex=1 -output-directory=../$(INFODIR)

.PHONY: all clean install uninstall commandtest

#*********************************Compile Process***************************************
all: checkTeX $(INFODIR)/% $(DOCDIR)/$(notdir $(basename $(FILE))).pdf viewpdf

checkTeX:
# Check file path argument
	@if [ ! -e $(FILE) ]; then \
		echo "Input make FILE=<filename>"; \
		exit 1;\
	fi;

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
#move Current directory into ./Src
	-@cd $(SRCDIR);\
	$(PLATEX) $(TEXFLAG) $(notdir $(FILE))

$(DOCDIR)/$(notdir $(basename $(FILE))).pdf: $(DVIS)
	$(DVI2PDF) -o $@ $^

viewpdf:
	@$(VIEWER) $(DOCDIR)/$(notdir $(basename $(FILE))).pdf&
#***************************************************************************************



#*********************************Remove Process****************************************
clean:
	$(RM) $(INFODIR) $(DOCDIR)
#***************************************************************************************



#***********************************Install Uninstal************************************
#There is taget for installing necessary packages
install:		
	sudo apt-get install nkf

	sudo apt-get -y install texlive-full latex-cjk-japanese

#There is taget for uninstalling unnecessary packages
uninstal:
	sudo apt-get remove nkf

	sudo apt-get remove texlive-full latex-cjk-japanese
#***************************************************************************************



commandtest:
	@echo "There is this target for testing fuzzy command."
	@echo "Let's optimize own code!!"

#colum
#-@command
#	'-':Even if the command on that line fails, execution moves to the next line
#	'@':Do not echo the command line
#
#command&
#	excute command under background
#
#$(notdir $(basename $(FILE)))
#	ex) TEST:=./hoge/test.txt
#	    $(notdir $(basename $(TEST)))   "./hoge/test">>"test"		
#	    >>test
#
#exit 1
#	Process Stop(status is error)

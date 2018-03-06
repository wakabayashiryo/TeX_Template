#
#  File-Name: Makefile
#
#  Created in: 2018/2/15
#  Author: Wakabayashi Ryo
#  Editor: Emacs

#command of LiveTex compiler
PLATEX	:= platex
#Automatically get bb informations command
XBB 	:= extractbb
#conver to pdf from .dvi
DVI2PDF	:= dvipdfmx
#pdf viewer
VIEWER  := evince
#remove command
RM		:= rm -r -f

OUTDIR	:= ./pdf
SRCDIR	:= ./Src
FIGDIR 	:= ./fig

FILE 	?= hoge.tex		#if undefined,hoge.txt is substituted

CHARCODE := nkf -g $(FILE)	#Get Charactor code

FIGFILE := *.png *.jpg *.pdf 
RMFILES := *.aux *.log *.lof *.toc *.dvi *.gz $(FIGDIR)/*.xbb

TEXFLAG := -synctex=1 -output-directory=./ --shell-escape

.PHONY: all clean install uninstall commandtest

#*********************************Compile Process***************************************
all: checkTeX %.xbb $(SRCDIR)/% ../$(OUTDIR)/$(notdir $(basename $(FILE))).pdf viewpdf

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
TEXFLAG += -kanji=sjis
endif
ifeq ($(CHARCODE),ISO-2022-JP)
TEXFLAG += -kanji=jis
endif

%.xbb:
	$(XBB) -x $(addprefix $(SRCDIR)/$(FIGDIR)/,$(FIGFILE))

$(SRCDIR)/%:
	-@mkdir -p $(OUTDIR)
#move Current directory into ./Src
	-@cd $(SRCDIR);\
	$(PLATEX) $(TEXFLAG) $(notdir $(FILE))

../$(OUTDIR)/$(notdir $(basename $(FILE))).pdf: 
	cd $(SRCDIR);\
	$(DVI2PDF) -o $@ *.dvi

viewpdf:
	@$(VIEWER) $(OUTDIR)/*.pdf&
#***************************************************************************************



#*********************************Remove Process****************************************
clean:
	$(RM) $(addprefix $(SRCDIR)/,$(RMFILES)) ./pdf
#***************************************************************************************



#***********************************Install Uninstal************************************
#There is taget for installing necessary packages
install:		
	sudo apt-get install nkf

	sudo apt-get -y install texlive-full latex-cjk-japanese

#There is taget for uninstalling unnecessary packages
uninstall:
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

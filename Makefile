#
#  File-Name: Makefile
#
#  Created in: 2018/2/15
#  Author: Wakabayashi Ryo

# PLATEX	:=	platex
# DVI2PDF	:=	dvipdfmx
# VIEWER  :=  evince
# RM		:=	rm -r -f

# INFODIR	:=	./Info
# DOCDIR	:=	./Doc
# SRCDIR	:=	./Src

# DVIS    :=  $(wildcard $(INFODIR)/*.dvi)

# .PHONY: all clean install uninstall  
#$(DOCDIR)/%.pdf viewpdf 

all:
    echo test
    # -@mkdir -p $(INFODIR)
    # -@mkdir -p $(DOCDIR)

#     CHARCODE := $(nkf -g $1)
# ifeq ($(CHARCODE),UTF-8)       # get character code from tex document 
#     KANJI := -kanji=utf8       #"case" of shell command is not supported
# else 
#     ifeq ($(CHARCODE),EUC-JP)
#         KANJI := -kanji=euc
#     else 
#         ifeq ($(CHARCODE),Shift-JIS)
#             KANJI := kanji=sjis
#         else 
#             ifeq ($(CHARCODE),ISO-2022-JP)    
#              	KANJI := -kanji=jis
# endif  
    
    # $(shell echo "test1")

    # $(shell cd $(SRCDIR))
    # $(shell $(PLATEX) -synctex=1 -output-directory="../$(INFODIR)" $(KANJI $(basename $1)))
    # $(shell cd ../)

# $(DOCDIR)/%.pdf: $(DVIS)
#     $(DVI2PDF) -o $@ $^
      
# viewpdf:
#     $(VIEWER) $(DOCDIR)/%.pdf&



# clean:
# 	$(RM) $(INFODIR) $(DOCDIR)

# install:
# 	sudo apt-get install nkf

# 	sudo apt-get -y install texlive-full latex-cjk-japanese

# uninstal:
# 	sudo apt-get remove nkf

# 	sudo apt-get remove texlive-full latex-cjk-japanese


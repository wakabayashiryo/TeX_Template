# Instruction for TeX Documents 

- ## Installation Method
    **installed packages**   
        1.nkf   
        2.texlive-full   
        3.latex-cjk-japanese   
        ***<font color="red">There packages consume free space of about 3GB</font>***   
    **command**   
    > ~/Tex_Template$ **make install**    
- ## Un-installation Method 
    **un-installed packages**   
        1.nkf   
        2.texlive-full   
        3.latex-cjk-japanese   
    **command**
    > ~/Tex_Template$ **make uninstall**   
---
- ## Main Method
    **command**
    > ~/Tex_Template$ **make [option]**   
    
    - ### option lists  
        |option|work|   
        |:----:|:---:|
        |FILE=filename|Compile TeX file of filename argument|   
        |clean|Remove ./Info & ./Doc directories|   
        |viewpdf|Open pdf file in ./Doc |   
    
---

- ## Directores Structure

    - ./Doc・・・Generated pdf file
    - ./Src・・・Tex documents
    - ./Info・・・Generated information files of tex docments after compiled.   
       
       **after compiled*
    ~~~ 
    .
    ├── Doc
    │   └── research_report.pdf
    ├── Info
    │   ├── abstract.aux
    │   ├── appendix.aux
    │   ├── conclution.aux
    │   ├── experiment.aux
    │   ├── introduction.aux
    │   ├── reference.aux
    │   ├── research_report.aux
    │   ├── research_report.dvi
    │   ├── research_report.lof
    │   ├── research_report.log
    │   ├── research_report.lot
    │   ├── research_report.synctex.gz
    │   ├── research_report.toc
    │   ├── thanks.aux
    │   └── theory.aux
    ├── LICENSE
    ├── Makefile
    ├── README.md
    └── Src
        ├── abstract.tex
        ├── appendix.tex
        ├── conclution.tex
        ├── fig
        │   ├── drive_circuit.eps
        │   └── drive_circuit.pdf
        ├── introduction.tex
        ├── jynu12.sty
        ├── reference.tex
        ├── research_report.tex
        ├── sotsuron.sty
        ├── thanks.tex
        └── theory.tex

    ~~~
---
- ## Screen in operation
![screen](./picture/screen.jpg)   

---

- ## LICENSE Information

    This software is released under the MIT License, see LICENSE
---

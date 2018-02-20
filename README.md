# How To Use TeX Project Template on Linux 

- ## How to Install 
    **Installed Packages**   
        1.nkf   
        2.texlive-full   
        3.latex-cjk-japanese   
        ***<font color="red">Worning:There packages consume free space of about 3GB!!</font>***   
    **Command**   
    > ~/TeX_Template$ **make install**    
- ## How to Un-Install 
    **Un-Installed Packages**   
        1.nkf   
        2.texlive-full   
        3.latex-cjk-japanese   
    **Command**
    > ~/TeX_Template$ **make uninstall**   
---
- ## Main Method
    **Command**
    > ~/TeX_Template$ **make [option]**   
    
    - ### Option Lists  
        |option|work|   
        |:----:|:---:|
        |FILE=filename|Compile TeX File of Filename Argument|   
        |clean|Remove ./Info & ./Doc directories|   
        |viewpdf|Open pdf File in ./Doc |   
    
---
- ## How to Get Start New Project
    [ ] 1. Creat New Repository on github   
    [ ] 2. Clone Template Repository from github   
        > ~/$ **git clone https://github.com/wakabayashiryo/TeX_Template.git**   
    [ ] 3. Rename Template Folder to New Name   
    [ ] 4. Move Current Directory into TeX_Template   
    [ ] 5. Add New Remote Address of New Repository   
        > ~/Hoge_Project$ **git remote add hoge https://github.com/yourid/repository.git**   
    [ ] 6. Push New Repository   
        > ~/Hoge_Project$ **git push hoge master**   

    **\*Worning** Do not push ***origin*** from Working Project   

    ### *How to Update Project into Template of Latest Edition*
    - Excute Below Command in Project Folder
        > git pull origin master

---
- ## Directores Structure

    - ./Doc・・・Generated pdf File
    - ./Src・・・TeX Documents
    - ./Info・・・Generated Information Files of TeX Docments after compiled.   
       
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
- ## Screen in Operation
![screen](./picture/screen.jpg)   

---
- ## Other
    
    ### **If You added Another Branchs to the Template Project, Be Sure to erase the Branch at the End.**   
    **Command**   

    > git push origin :branch-names

---
- ## LICENSE Information
    This software is released under the MIT License, see LICENSE
---

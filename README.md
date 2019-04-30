1. 简介

根目录文件：
ctex.cmd    视窗命令行脚本，编译单个文件
mtex.cmd    视窗命令行脚本，编译部分或整个项目
history.txt 版本历史
readme.txt  说明文档

子目录结构：
├─graph     矢量图形
│  ├─src    图形源文件
│  └─tmp    临时目录，编译图形用
├─img       点阵图像
├─src       主文档源文件
│  └─texlet 一些示例的 LaTeX 片段
└─tmp       临时目录，编译主文档用

2. 系统要求

2.1 MikTeX 2.9  http://miktex.org/
    2.8 版应该也行，可能需要改动若干配置。本源码包附带的 mtex.cmd 脚本调用了 texify.exe，TeX Live 不含此程序，编译时需要更多的手工操作。

2.2 字体
    源码中不包含字体，读者请自行准备，酌情修改 src/lang.tex 文件中字体配置。
    

2.3 Simpsons Package https://ctan.org/tex-archive/usergrps/uktug/baskervi/4_4/
    最新版 MilTeX 能够自动下载该宏包；或者也可用以下方法，
    1) 下载 simpsons.sty，放到 MIKTEX-ROOT/tex/latex/simpsons目录.
    2) MikTeX -> Maintainence -> Settings -> General -> Refresh FNDB 或在命令行下执行 initexmf --update-fndb.

3. 编译方法
3.1 编译
    编译全部
        mtex -build all

    编译图形
        mtex -build graph

    编译主文档
        mtex -build main

    删除全部临时文件
        mtex -clean all
    
    删除图形临时文件
        mtex -clean graph
    
    删除主文档临时文件
        mtex -clean main                

3.2 排错
    编译时可能会遇到下面的错误信息。

    1) ** WARNING ** Image format conversion for PSTricks failed.
    用下面命令打开dvipdfmx配置文件，
        initexmf --edit-config-file dvipdfmx
    
    从 miktex\root\dvipdfm\config\dvipdfmx.cfg 里复制下面带 D 参数的那行，粘贴到上面那个文件里。那行一般是这样的，
        
    D  "mgs.exe -q -dNOPAUSE -dBATCH -sPAPERSIZE=a0 -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dAutoFilterGrayImages=false -dGrayImageFilter=/FlateEncode -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -dUseFlateCompression=true -sOutputFile=\"%o\" \"%i\" -c quit" 

    2) ** WARNING ** Failed to convert input string to UTF16.

        \usepackage[pdfencoding=auto]{hyperref} % unicode option causes the warning

    3) ** WARNING ** Version of PDF file (1.5) is newer than version limit specification.

        xelatex -output-driver="xdvipdfmx -V 5"
  
    或者在 dvipdfmx.cfg 里加上如下版本设置，
        V 5

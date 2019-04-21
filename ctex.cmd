:VARIABLES
@SET AUXDIR=tmp
@SET SRCDIR=src
@SET INTERACTION=nonstopmode
@SET DRIVER="xdvipdfmx -V 5"

@IF "%1"=="" GOTO USAGE
@IF "%2"=="" GOTO USAGE

@IF "%1"=="-x" GOTO XELATEX
@IF "%1"=="-p" GOTO PDFLATEX
@IF "%1"=="-b" GOTO BIBTEX
@IF "%1"=="-m" GOTO METAPOST
@ECHO Invalid option.

:USAGE
@ECHO TeX Compiler 0.5 (2019-04-09) by Alpha Huang
@ECHO Compile a LaTeX or MetaPost file with xelatex, pdflatex, bibtex or mpost.
@ECHO.
@ECHO Usage: ctex OPTION FILE
@ECHO  -x   xelatex.
@ECHO  -p   pdflatex.
@ECHO  -b   bibtex.
@ECHO  -m   mpost.

@GOTO :EOF

:XELATEX
@REM xelatex -aux-directory=%AUXDIR% -include-directory=%SRCDIR% -interaction=%INTERACTION% -output-driver=%DRIVER% -quiet %2
xelatex -aux-directory=%AUXDIR% -include-directory=%SRCDIR% -interaction=%INTERACTION% -quiet %2
@GOTO :EOF

:PDFLATEX
pdflatex -aux-directory=%AUXDIR% -include-directory=%SRCDIR% -interaction=%INTERACTION% %2
@GOTO :EOF

:BIBTEX
bibtex -include-directory=%SRCDIR% %2
@GOTO :EOF

:METAPOST
@SET MPINPUTS=%SRCDIR%
mpost -interaction=%INTERACTION% %2
@MOVE fig.log %AUXDIR%
@MOVE fig.mpx %AUXDIR%
@GOTO :EOF

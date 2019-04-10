:VARIABLES
@SET PDFLATEX=xelatex
@SET MAINFILE=src/lnotes2.tex
@SET OPTIONS="-output-driver=\"xdvipdfmx -V 5\""

@IF "%1" == "-clean" GOTO CLEAN
@IF "%1" == "-build" GOTO BUILD

:USAGE
@ECHO TeX Manager 0.6 (2013-04-07) by Alpha Huang
@ECHO Manage workflow of LaTeX Notes 2.
@ECHO.
@ECHO Usage: mtex [ACTION] [TARGET]
@ECHO ACTION: -clean    Delete auxiliary files of TARGET.
@ECHO         -build    Build TARGET.
@ECHO TARGET: main      Main file.
@ECHO         graph     Graphics files.
@ECHO         all       All files.
@GOTO END

:CLEAN
@IF "%2" == "main" GOTO CLEAN_MAIN
@IF "%2" == "graph" GOTO CLEAN_GRAPH
@IF "%2" == "all" GOTO CLEAN_ALL
@ECHO Invalid TARGET
@GOTO USAGE

:CLEAN_MAIN
@DEL tmp\*.*
@GOTO END

:CLEAN_GRAPH
@DEL graph\tmp\*.*
@GOTO END

:CLEAN_ALL
@DEL tmp\*.*
@DEL graph\tmp\*.*
@GOTO END

:BUILD
@IF "%2" == "main" GOTO BUILD_MAIN
@IF "%2" == "graph" GOTO BUILD_GRAPH
@IF "%2" == "all" GOTO BUILD_ALL
@ECHO Invalid TARGET
@GOTO USAGE

:BUILD_MAIN
@MOVE tmp\*.* . > NUL

@REM texify -pqV --tex-option=%OPTIONS% %MAINFILE%
texify -pqV %MAINFILE%
makeindex org
makeindex people
@REM texify -pqV --tex-option=%OPTIONS% %MAINFILE%
texify -pqV %MAINFILE%

@MOVE *.aux tmp > NUL
@MOVE *.bbl tmp > NUL
@MOVE *.blg tmp > NUL
@MOVE *.exa tmp > NUL
@MOVE *.idx tmp > NUL
@MOVE *.ilg tmp > NUL
@MOVE *.ind tmp > NUL
@MOVE *.loe tmp > NUL
@MOVE *.lof tmp > NUL
@MOVE *.log tmp > NUL
@MOVE *.lot tmp > NUL
@MOVE *.out tmp > NUL
@MOVE *.toc tmp > NUL

@GOTO END

:BUILD_GRAPH
@CD graph
CALL ctex -x mini
CALL ctex -m fig
CALL ctex -x pst
CALL ctex -p pgf
CALL ctex -x beamer
CALL ctex -x beamer-warsaw
CALL ctex -x letter-bus
CALL ctex -x letter-memo
CALL ctex -x letter-pr
CALL ctex -x letter-std
CALL ctex -x letter-env
CALL ctex -x cv-banking
CALL ctex -x cv-casual
CALL ctex -x cv-classic
CALL ctex -x cv-old
@CD ..
@GOTO END

:BUILD_ALL

@GOTO END

:END

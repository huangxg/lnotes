:VARIABLES
@SET PDFLATEX=xelatex
@SET MAINFILE=src/lnotes2.tex
@SET OPTIONS="-output-driver=\"xdvipdfmx -V 5\""

@IF "%1" == "-clean" GOTO CLEAN
@IF "%1" == "-build" GOTO BUILD

:USAGE
@ECHO TeX Manager 0.7 (2019-04-12) by Alpha Huang
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
@IF "%2" == "main" (
  CALL :CLEAN_MAIN
  @GOTO :EOF
) ELSE @IF "%2" == "graph" (
  CALL :CLEAN_GRAPH
  @GOTO :EOF
) ELSE @IF "%2" == "all" (
  CALL :CLEAN_MAIN
  CALL :CLEAN_GRAPH
  @GOTO :EOF
) ELSE (
  @ECHO Invalid TARGET
  @ECHO. 
  @GOTO USAGE
)

:CLEAN_MAIN
@DEL tmp\*.*
@ECHO main temporary files cleaned.
@EXIT /B

:CLEAN_GRAPH
@DEL graph\tmp\*.*
@ECHO graph temporary files cleaned.
@EXIT /B

:BUILD
@IF "%2" == "main" (
  CALL :BUILD_MAIN
  @GOTO :EOF
) ELSE @IF "%2" == "graph" (
  CALL :BUILD_GRAPH
  @GOTO :EOF
) ELSE @IF "%2" == "all" (
  CALL :BUILD_MAIN
  CALL :BUILD_GRAPH
  @GOTO :EOF
) ELSE (
  @ECHO Invalid TARGET
  @ECHO.
  @GOTO USAGE
)

:BUILD_MAIN
@ECHO building main
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

@ECHO.
@ECHO done
@EXIT /B

:BUILD_GRAPH
@ECHO building graph

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

@ECHO.
@ECHO done
@EXIT /B

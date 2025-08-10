@echo off
setlocal

rem --- Configuration ---
set MAIN_SRC=src/lnotes2.tex
set OUT_DIR=tmp
set PDF_NAME=lnotes2.pdf
rem --- End Configuration ---

if "%1" == "" goto USAGE
if "%1" == "-clean" goto CLEAN
if "%1" == "-build" goto BUILD

:USAGE
echo.
echo TeX Maker 0.1 (2025-08-02) by Alpha Huang
echo Manage workflow of LaTeX Notes 2.
echo.
echo Usage: mktex [ACTION] [TARGET]
echo.
echo Actions:
echo   -clean      Clean temporary files.
echo   -build      Build the project.
echo.
echo Targets:
echo   main        The main LaTeX document.
echo   graph       Graphics files.
echo   all         All targets.
echo.
goto END

:CLEAN
if "%2" == "main" goto CLEAN_MAIN
if "%2" == "graph" goto CLEAN_GRAPH
if "%2" == "all" (
    call :CLEAN_MAIN
    call :CLEAN_GRAPH
    goto END
)
echo Invalid target for -clean.
goto USAGE

:BUILD
if "%2" == "main" goto BUILD_MAIN
if "%2" == "graph" goto BUILD_GRAPH
if "%2" == "all" (
    call :BUILD_MAIN
    call :BUILD_GRAPH
    goto END
)
echo Invalid target for -build.
goto USAGE

:CLEAN_MAIN
echo Cleaning main target...
del /F /Q "%OUT_DIR%\*.*"
echo Done.
goto END

:CLEAN_GRAPH
echo Cleaning graph target...
del /F /Q "graph\tmp\*.*"
echo Done.
goto END

:BUILD_MAIN
echo Building main target...
latexmk -pdf -xelatex -cd -output-directory=../%OUT_DIR% %MAIN_SRC%
if ERRORLEVEL 1 (
    echo LaTeX build failed.
    goto END
)
echo Copying PDF to root...
copy /Y "%OUT_DIR%\%PDF_NAME%" "%PDF_NAME%"
echo Done.
goto END

:BUILD_GRAPH
echo Building graph target...
cd graph
call ctex -x mini
call ctex -m fig
call ctex -x pst
call ctex -p pgf
call ctex -x beamer
call ctex -x beamer-warsaw
call ctex -x letter-bus
call ctex -x letter-memo
call ctex -x letter-pr
call ctex -x letter-std
call ctex -x letter-env
call ctex -x cv-banking
call ctex -x cv-casual
call ctex -x cv-classic
call ctex -x cv-old
cd ..
echo Done.
goto END

:END
endlocal
@echo off
REM - Project Name: newtoy.cmd

REM - Author: Brian P. Hartnett Jr.

REM - Function: Command to make project directories
REM - Example: newtoy [project_name] --python

REM - Python Packages Layout (--python)
REM - [project_name]
REM -   - docs/
REM -   - src/
REM -   - tests/
REM -   - README.md
REM -   - LICENSE

REM - Future Additions: Node/NPM, Next-JS, Vite

REM - If command is ran raw, 'newtoy', print out usage

IF /I "%~1" == "" GOTO :USAGE
IF /I "%~1" == "help" GOTO :USAGE

REM Python
IF /I "%~2"=="--python" (

	if exist "%~1\" (
  		echo ERROR: Folder "%~1" already exists.
  		exit /b 1
	)

	echo Creating python project.
	md "%~1"
	pushd "%~1"
	md "docs" "src" "tests"
	echo # %~1 > "README.md"
	type nul > "LICENSE"
	popd
	exit /b 0
)

REM Node

REM Next-JS

REM Vite


REM Unknown Flag
echo =============== [Newtoy] ===============
echo.
echo ERROR: Invalid Flag
echo.
echo Flag format: --[flag]
echo.
echo Supported flags: --python
echo.
echo Example: newtoy cool_project --python
exit /b 1

REM Usage
:USAGE
echo.
echo =============== [Newtoy] ===============
echo.
echo Usage: newtoy [project_name] --[project_type]
echo.
echo Example: newtoy cool_project --python
exit /b 0


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
IF /I "%~2"=="python" (

	if exist "%~1\" (
  		echo ERROR: Folder "%~1" already exists.
  		exit /b 1
	)

	md "%~1"
	pushd "%~1"
	md "docs" "src" "tests"
	echo # %~1 > "README.md"
	type nul > "LICENSE"

	IF /I "%~3"=="--agentic" (
		call :WRITE_CONTEXT "CONTEXT.md"
		call :WRITE_AGENTS "AGENTS.md"
	)

	popd
	echo [+] Created Python project folder: "%1"
	exit /b 0
)

REM Node

REM Next-JS

REM Vite

REM Write CONTEXT.md File
:WRITE_CONTEXT
(
    echo # Project Context
    echo.
    echo ^> **AGENT INSTRUCTIONS:**
    echo ^> - Keep entries short and factual — this is a handoff document
    echo ^> - When starting a new worktree, copy the latest status into "In progress"
    echo ^> - When finishing a worktree, move completed work to "Just finished" and delete stale worktree entry
    echo ^> - Never delete previous entries, just add new ones above the most recent entry
    echo.
    echo ## Queued Tasks
    echo -
    echo.
    echo ## Open Issues ^(carry forward until resolved^)
    echo -
    echo.
    echo # Example Entry:
    echo.
    echo ## 2026-03-05 ^(Date^)
    echo.
    echo **Status:**
    echo.
    echo **Just Finished:**
    echo -
    echo -
    echo -
    echo.
    echo **In Progress:**
    echo -
    echo.
    echo **Next:**
    echo -
    echo.
    echo **Known issues:**
    echo -
    echo.
    echo **Active worktrees:**
    echo -
    echo.
) > "%~1"
exit /b 0

REM Write AGENTS.md File
:WRITE_AGENTS
(
    	echo # Agents
   	echo.
	echo # AGENTS.md
	echo.
	echo This file is for LLMs and other automated contributors working in this repo.
) > "%~1"
exit /b 0

REM Invalid argument / unknown flag
echo.
echo =============== [Newtoy] ===============
echo.
echo ERROR: Invalid argument: %~1
echo.
echo Usage:
echo   newtoy ^<project_name^> ^<project_type^> [flags]
echo.
echo Project Types:
echo   python
echo.
echo Optional Flags:
echo   --agentic
echo.
echo Examples:
echo   newtoy cool_project python
echo   newtoy cool_project python --agentic
echo.
exit /b 1

REM Usage
:USAGE
echo.
echo =============== [Newtoy] ===============
echo.
echo Usage:
echo   newtoy ^<project_name^> ^<project_type^> [flags]
echo.
echo Project Types:
echo   python        Create a Python project scaffold
echo.
echo Optional Flags:
echo   --agentic     Add CONTEXT.md and AGENTS.md workflow files
echo.
echo Examples:
echo   newtoy cool_project python
echo   newtoy cool_project python --agentic
echo.
exit /b 0


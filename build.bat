@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

IF NOT EXIST build mkdir build
pushd build

IF "%NTOP_VERSION%"=="" SET NTOP_VERSION=dev

IF "%~1"=="-release" (
	REM Release build
    echo Release build
	cl /DNTOP_VER="%NTOP_VERSION%" -W4 /GA /MT /O2 ..\ntop.c ..\util.c ..\vi.c Advapi32.lib User32.lib
) else (
    REM Debug build
    echo Debug build
    cl /DNTOP_VER=%NTOP_VERSION% -W4 /GA /MT /Z7 ..\ntop.c ..\util.c ..\vi.c Advapi32.lib User32.lib
)

echo Built version %NTOP_VERSION%!

popd

echo off

REM set /P filepathname="Path to map bsp: "
set filepathname=%1
REM set /P outputdirname="Output dir: "
set outputdirname=%2



echo .
echo converting map to gltf...
echo .

%~dp0\scripts\bsp-converter.exe %filepathname%

echo .
echo converting textures to dds (be patient)...
echo .

set /A i=0
set /A one=1
for %%f in (%~dp0\textures\*.png) do (
	%~dp0\scripts\png2dds\png2ddscmd.exe -i %%f -o %~dp0\textures /f >nul 2>&1 & del %%f
)

echo fixing texure refs...
echo .

for %%f in (%~dp0\*.gltf) do (
	pause
	%~dp0\scripts\fix_image_refs.exe %%f "%~dp0\textures\
	
	echo .
	echo converting map to obj/mtl...
	echo .
	
	"%ProgramFiles%\Blender Foundation\Blender 4.0\blender.exe" -b "%~dp0\scripts\empty.blend" -P "%~dp0\scripts\convert_to_obj.py" -- %%f %outputdirname%
)
pause
for %%f in (%~dp0\*.gltf) do (
	del %%f
)

for %%f in (%~dp0\*.bin) do (
	del %%f
)

for %%f in (%~dp0\*.png) do (
	del %%f
)

REM pause

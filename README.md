#Halflife Map to OBJ converter
A batch tool for converting half life bsp files to brickbench-compatible objs

##CREDITS:

This tool was created by SpacingClover, distribute how you like, don't do anything bad with it
bsp_converter by Alexey Ivanchukov (lewa_j) 2022 MIT Liscence
png2dds by easy2convert.com, it's freeware so I assume this use is fine, let me know if I can't


##DEPENDANCIES:

Python 3.13 or later
Blender 4.0.1 or later


##USAGE:

Convert halflife .bsp maps into .obj files with texture refs to the local /texures folder (as .dds)

Use via terminal with: absolute path to .bsp, output dir; such as:
`bsp2obj.bat "path_to_maps/c1a0.bsp" "documents/maps/"`

Theoretically compatible with all goldsrc maps, not tested, may take some finagling
If you DONT want .dds textures, you can edit the .bat fairly easily
If you DONT want a .obj file, the hlbsp_converter is included in it's entirety

##WARNINGS:

Do not leave any wanted pngs in this directory, they will be deleted.
Overwrites and invalid paths are not checked for, be careful

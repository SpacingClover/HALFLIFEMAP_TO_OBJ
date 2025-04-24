import bpy
import sys

sourcefilepath = sys.argv[sys.argv.index("--")+1]
sourcefilename = sourcefilepath.split("\\")[-1]
outputdirname = sys.argv[sys.argv.index("--")+2]

if not (outputdirname[-1] == '\\' or outputdirname[-1] == '/'):
    outputdirname = outputdirname + '\\'

bpy.ops.import_scene.gltf(filepath=sourcefilepath, files=[{"name":sourcefilename, "name":sourcefilename}], loglevel=50, import_pack_images=False)

# select only building geometry
bpy.ops.object.select_all(action='DESELECT')
bpy.data.objects["*0"].select_set(True)

bpy.ops.wm.obj_export(filepath=outputdirname+sourcefilename.split('.')[0]+".obj", export_selected_objects=True)
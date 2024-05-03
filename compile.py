import os
import subprocess
import json

ext = '.scad'
cmd = 'openscad'

python_cmd = 'python'
objectifier = '../objectifier/objectifier.py'

def is_in_arr(elem, arr):
    for e in arr:
        if e == elem:
            return True
    
    return False

files = os.listdir('.')
exclude_path = './exclude.json'

exclude_arr = []
if os.path.exists(exclude_path):
    with open(exclude_path, 'r') as f:
        excs = json.loads(f.read(-1))
        for ex in excs:
            exclude_arr.append(ex)

for file in files:
    ext_len = len(ext)
    end = file[-ext_len:]
    if end != ext:
        continue
    
    name = file[:-ext_len]
    
    if not is_in_arr(file, exclude_arr):
        #os.popen(f'{cmd} -o ./stl/{name}.stl {file}')
        stl_path = f'./stl/{name}.stl'
        subprocess.run(args=[
            cmd,
            '-o',
            f'./stl/{name}.stl',
            f'{file}'
        ])
        subprocess.run(args=[
            python_cmd,
            objectifier,
            '-i',
            stl_path,
            '-o',
            f'./obj/{name}.obj'
        ])

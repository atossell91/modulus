import os
import subprocess
import json

ext = '.scad'
cmd = 'openscad'

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
        subprocess.run(args=[
            cmd,
            '-o',
            f'./stl/{name}.stl',
            f'{file}'
        ])

from distutils.dir_util import copy_tree
import os
import sys

ROOT = sys.argv[1]
PATH = os.path.join(ROOT, "generator")
TARGET = sys.argv[2]

maps = []
with open(os.path.join(ROOT, 'maps.txt'), 'r') as f:
    for line in f:
        if line.startswith('#'):
            continue
        if line.strip() == '':
            continue
        maps.append(line.strip())

print(maps)

missions = [f for f in os.listdir(PATH) if os.path.isdir(os.path.join(PATH, f))]

for mission in missions:
    print(mission)
    for map in maps:
        copy_tree(os.path.join(PATH, mission), os.path.join(TARGET, mission.replace(".VR", "." + map)))

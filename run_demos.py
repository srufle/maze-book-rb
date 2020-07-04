#!/usr/bin/env python3
import glob
import os

files = glob.glob("src/demo_*.rb")
for file in files:
    dirname, basename = os.path.split(file)
    # print(basename)
    print(f"Running {file}")
    os.system(f"ruby -Csrc -I. {basename}")
    print("")

#!/usr/bin/env python3
import glob
import os

files = glob.glob("img/*.png")
for file in files:
    print(f"Delete {file}")
    os.remove(file)


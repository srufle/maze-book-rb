#!/usr/bin/env python3
import glob
import os

files = glob.glob("*_demo.rb")
for file in files:
    os.system(f"ruby -I. {file}")
    print("")
